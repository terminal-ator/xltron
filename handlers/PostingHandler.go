package handlers

import (
	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/api"
	"github.com/terminal-ator/xltron/models"
	"log"
	"strconv"
	"time"
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
		endDate = time.Now().Format("2006-01-02")
		startDate = time.Now().AddDate(0,0,-7).Format("2006-01-02")
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

type DeleteRequest struct {
	JournalID int64 `json:"journal_id"`
}
func (ps *PostingHandler) DeleteJournalID(c *gin.Context){

	jid := c.Param("id")
	journalID ,err := strconv.Atoi(jid)

	if err!=nil{
		log.Println("Invalid request",err.Error())
		c.String(403, "Invalid request params")
		return
	}

	err = ps.postingService.DeleteJournal(int64(journalID))

	if err!=nil{
		log.Println("Invalid request",err.Error())
		c.String(403, "Invalid request params")
		return
	}

	c.JSON(200, gin.H{"deletedJournal": journalID})

}

func (ps *PostingHandler) UpdateJournal(c *gin.Context){
	var Journal models.AJournal
	err := c.BindJSON(&Journal)

	if err!=nil{
		log.Println("Failed to bind to the json object in journal creation", err.Error())
		c.String(403,"Invalid format")
		return
	}
	journal, err := ps.postingService.MakeOrUpdateJournal(Journal)

	if err!=nil{
		log.Println("Failed to create journal exiting", err.Error())
		c.String(500,"Failed to save the journal")
		return
	}

	c.JSON(200, journal)
}
