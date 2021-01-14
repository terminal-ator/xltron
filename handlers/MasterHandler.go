package handlers

import (
	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/api"
	"github.com/terminal-ator/xltron/models"
	"log"
	"strconv"
)

type MasterHandler struct {
	service api.MasterService
}

func ConstructMasterHandler(service api.MasterService) MasterHandler{
	return MasterHandler{
		service: service,
	}
}

func (mh *MasterHandler) PostCreateMaster(c *gin.Context){
	var master models.Master
	company := c.Param("company")

	err := c.BindJSON(&master)

	if err!=nil{
		log.Println("Failed to validate request", err.Error())
		c.String(403, "Bad request")
		return
	}

	cmp, _ := strconv.Atoi(company)

	master.CompanyID = int32(cmp)

	newMaster, masterErr := mh.service.CreateMaster(master)

	if masterErr!=nil{
		log.Println("Failed to create master", masterErr.Error())
		c.String(500,"Something happened")
		return
	}

	c.JSON(200, newMaster)
}

func (mh *MasterHandler) PutUpdateMaster(c *gin.Context){

	company := c.Param("company")

	cmpny, convError := strconv.Atoi(company)

	if convError!=nil{
		c.String(404, "Bad request")
		return
	}

	var master models.Master

	err := c.BindJSON(&master)
	master.CompanyID = int32(cmpny)

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
	company := c.MustGet("company")
	cmpny := company.(string)
	cmp, cerr := strconv.Atoi(cmpny)

	if cerr!=nil{
		c.String(400,"Bad request")
		return
	}
	masters, err := mh.service.GetMastersForCompany(cmp)

	if err!=nil{
		c.String(500, "Failed to fetch masters")
		return
	}

	c.JSON(200, masters)
}