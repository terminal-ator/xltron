package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"io"
	"log"
	"net/http"
	"os"
	"strconv"
)

func SalesUploadByExcel(c *gin.Context) {

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

	// save to database
	company := c.Query("company")
	companyID := c.Query("id")
	sID := c.Query("sales")

	salesID, err := strconv.Atoi(sID)
	x, _ := strconv.Atoi(companyID)

	if err != nil {
		c.String(404, "Invalid request")
		log.Printf("BAD ID")
		return
	}

	excelMap, err := ExcelToMap("./uploads/" + handler.Filename)

	if err != nil {
		log.Fatalf("Error while processing the file: %s", err.Error())
		c.String(http.StatusInternalServerError, err.Error())
	}

	s_count, e_count, err := SaveExcelMapToDBSales(excelMap,fetchKeys(), company, int32(salesID), int64(x))

	log.Println(s_count, e_count)

	if err !=nil{
		log.Println("Error creating the sales in database, exiting", err.Error())
		c.String(http.StatusInternalServerError, "Please try again with a different format")
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"success": s_count,
		"error": e_count,
	})

}

func fetchKeys() map[string]string{
	return map[string]string{
		"name": "name",
		"amount":"amount",
		"billno":"billno",
		"date":"date",
	}
}
