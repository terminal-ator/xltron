package handlers

import (
	"database/sql"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/auth"
	"github.com/terminal-ator/xltron/services"
	"github.com/terminal-ator/xltron/utils"
	"io"
	"log"
	"net/http"
	"os"
	"strconv"
)

type uploadHandler struct {
	service services.UploadService
}

func InitUpload(r *gin.RouterGroup, db *sql.DB){
	uploadService := services.ConstructUploadService(db)
	handler := uploadHandler{service: uploadService}
	uploads := r.Group("/upload")
	uploads.Use(auth.CompanyTokenUser())
	uploads.POST("/sales",handler.UploadSales)

}


func fetchKeys() map[string]string{
	return map[string]string{
		"name": "name",
		"amount":"amount",
		"billno":"billno",
		"date":"date",
	}
}
func (u *uploadHandler) UploadSales(c *gin.Context){

	company, err := utils.ExtractCompany(c)

	if err!=nil{
		utils.HandleError(c,utils.INVALID_USER)
		return
	}

	file, handler, err := c.Request.FormFile("upload")

	if err != nil {
		fmt.Println(err.Error())
		c.String(http.StatusBadRequest, "Failed reading the file")
		return
	}
	defer file.Close()

	//save the file
	// fmt.Fprintf(w, "%v", handler.Header)
	f, err := os.OpenFile("./uploads/"+handler.Filename, os.O_WRONLY|os.O_CREATE, 0666)
	if err != nil {
		fmt.Println(err)
		// w.WriteHeader(http.StatusBadRequest)
		c.String(http.StatusInternalServerError, err.Error())
		return
	}
	defer f.Close()
	io.Copy(f, file)
	uploadCompany := c.Query("company")
	sID := c.Query("sales")
	salesID, _ := strconv.Atoi(sID)
	excelMap, err := utils.ExcelToMap("./uploads/"+ handler.Filename)
	saved, errored, err := u.service.ImportBasicSales(excelMap,fetchKeys(), uploadCompany, int64(salesID) ,company)
	if err!=nil{
		log.Println("Error while saving the sales")
		utils.HandleError(c,"INTERNAL_ERROR")
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"success" : saved,
		"error" : errored,
	})

}