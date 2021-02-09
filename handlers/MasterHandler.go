package handlers

import (
	"database/sql"
	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/services"
	"github.com/terminal-ator/xltron/auth"
	"github.com/terminal-ator/xltron/models"
	"github.com/terminal-ator/xltron/utils"
	"log"
)

type MasterHandler struct {
	service services.MasterService
}

func ConstructMasterHandler(service services.MasterService) MasterHandler{
	return MasterHandler{
		service: service,
	}
}
func InitMaster(r *gin.RouterGroup, DB *sql.DB){
	masterService := services.ConstructMasterService(DB)
	masterHandler := ConstructMasterHandler(&masterService)
	master:= r.Group("/master")
	master.Use(auth.CompanyTokenUser())
	{
		master.GET("/", masterHandler.GetAllAccounts)
		master.POST("/", masterHandler.PostCreateMaster)
		master.PUT("/",masterHandler.PutUpdateMaster)
	}

}

func (mh *MasterHandler) PostCreateMaster(c *gin.Context){
	var master models.Master
	cmp, has := c.Get("company")
	if !has{
		c.JSON(401,utils.GeneralResponse{
			Code:    utils.RE_AUTH,
			Message: "Token invalid",
			Data:    nil,
		})
		return
	}
	company := int64(cmp.(float64))
	err := c.BindJSON(&master)
	if err!=nil{
		log.Println("Failed to validate request", err.Error())
		c.String(403, "Bad request")
		return
	}

	master.CompanyID = int32(company)

	newMaster, masterErr := mh.service.CreateMaster(master)

	if masterErr!=nil{
		log.Println("Failed to create master", masterErr.Error())
		c.String(500,"Something happened")
		return
	}

	c.JSON(200, newMaster)
}

func (mh *MasterHandler) PutUpdateMaster(c *gin.Context){

	cmp, has := c.Get("company")
	if !has{
		c.JSON(401,utils.GeneralResponse{
			Code:    utils.RE_AUTH,
			Message: "Token invalid",
			Data:    nil,
		})
		return
	}
	company := int64(cmp.(float64))
	var master models.Master
	err := c.BindJSON(&master)
	master.CompanyID = int32(company)

	if err != nil {
		c.String(400, "Bad request")
		return
	}

	updatedMaster, err := mh.service.UpdateMaster(master)

	if err!=nil{
		c.String(500,"Failed to update master")
		return
	}

	log.Printf("%v", updatedMaster)

	c.JSON(200,updatedMaster)


}

func (mh *MasterHandler)GetAllAccounts(c *gin.Context) {
	company, has := c.Get("company")
	cmpny := int(company.(float64))
	if !has{
		c.JSON(401,utils.GeneralResponse{
			Code:    utils.RE_AUTH,
			Message: "Token invalid",
			Data:    nil,
		})
		return
	}
	masters, err := mh.service.GetMastersForCompany(cmpny)

	if err!=nil{
		c.String(500, "Failed to fetch masters")
		return
	}

	c.JSON(200, masters)
}