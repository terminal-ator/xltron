package handlers

import (
	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/services"
	"github.com/terminal-ator/xltron/utils"
	"log"
	"strconv"
)

type BeatHandler struct {
	service services.BeatService
}

func ConstructBeatHandler( service services.BeatService) BeatHandler{
	return BeatHandler{
		service: service,
	}
}

func (bh *BeatHandler) GetBeatsAndGroups(c *gin.Context){

	// @param: companyID
	companyID := c.Param("companyID")

	convertedID, err := strconv.Atoi(companyID)

	if err!=nil{
		utils.ErrorHandler(err,c)
		return
	}

	beats, groups, err := bh.service.FetchBeatsAndGroups(convertedID)

	c.JSON(200, gin.H{
		"beats": beats,
		"groups": groups,
	})

}



func (bh *BeatHandler) PostQuickCreateBeat(c *gin.Context){

	cmpID, hasCmp := c.Get("company")

	if !hasCmp{
		log.Println("No company found, returning")
		c.String(400,"Need Authorization")
		return
	}

	companyID, err := strconv.Atoi(cmpID.(string))

	if err!=nil{
		log.Println("The companyid must be a number", err.Error())
		c.String(400,"Authorization failed due to conversion error")
		return
	}

	name := c.Param("name")

	if name==""{
		log.Println("The beat name is should not be empty")
		c.String(403, "The company name should not be empty")
		return
	}

	beats, groups, err := bh.service.CreateBeats(companyID, name)

	if err!=nil{
		log.Println("Cannot fetch beats and groups", err.Error())
		c.String(500,"Internal server error, when finding beats and groups")
		return
	}

	c.JSON(200, gin.H{
		"beats": beats,
		"groups": groups,
	})

}
