package handlers

import (
	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/api"
	"log"
	"strconv"
)

type PostingHandler struct {
	companyService api.CompanyService
	postingService api.PostingService
}

func ConstructPostingHandler(cService api.CompanyService, pService api.PostingService) PostingHandler{
	return PostingHandler{
		companyService: cService,
		postingService: pService,
	}
}


func (ps *PostingHandler) GetJournalsForID(c *gin.Context){

	id := c.Param("id")
	startDate := c.Query("start")
	endDate := c.Query("end")

	if startDate=="" && endDate==""{

		// construct last week dates

		// get yearID
		yID, yErr := c.Get("yearID")
		if !yErr{
			log.Println("No year found, please provide start and end date")
			c.String(403,"No year found, please provide a start and end date")
			return
		}
		yearID, err := strconv.Atoi(yID.(string))
		if err!=nil{
			c.String(403,"The year id has to be a number")
			return
		}

		startDate, endDate, err = ps.companyService.GetStartAndEndDateForYearID(int64(yearID))

		if err!=nil{
			c.String(403,"The year is not valid, please provide dates")
			return
		}
	}

	masterID, err := strconv.Atoi(id)
	if err!=nil{
		log.Println("No master found")
		c.String(403,"The master id is not valid")
		return
	}
	result , err := ps.postingService.GetPostingHistoryForMasterDateWise(int64(masterID),startDate,endDate)

	if err!=nil{
		c.String(403,"No record found")
		return
	}

	c.JSON(200, result)
}
