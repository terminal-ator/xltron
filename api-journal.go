package main

import (
	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/models"
	"log"
	"strconv"
	"time"
)

func MakeJournal(c *gin.Context) {

	var Journal models.AJournal
	c.BindJSON(&Journal)

	tx, _ := DB.Begin()
	if Journal.ID == 0 {
		Journal.MakeJournal(tx)
	} else {
		err := Journal.UpdateJournal(tx)
		if err != nil {
			ErrorHandler(err, c, "Failed while updating journal")
			return
		}
	}
	tx.Commit()
	c.JSON(200, Journal)

}

func AddCheque(c *gin.Context) {
	var chq models.Cheque
	c.BindJSON(&chq)

	if chq.ID == 0 {
		err := chq.Save(DB)
		if err != nil {
			log.Println("Failed horribly: ", err.Error())
			c.String(500, "So sorry")
			return
		}
	}
	c.String(200, "Wow it worked")
}

func AddCheques(c *gin.Context) {
	var cheques []models.Cheque
	c.BindJSON(&cheques)
	err := models.SaveCheques(DB, cheques)
	ErrorHandler(err, c, "Failed while saving a cheque")
}

func GetCheques(c *gin.Context) {
	masterid := c.Param("masterid")

	id, _ := strconv.Atoi(masterid)
	chqs := models.FetchChequesByMasterID(DB, int32(id))
	c.JSON(200, chqs)
}

func TogglePassed(c *gin.Context) {
	cid := c.Param("cid")
	id, _ := strconv.Atoi(cid)
	log.Println(id)
	_, err := DB.Exec(`Update cheques set passed = not passed where id=$1`, id)

	if err != nil {
		ErrorHandler(err, c, "Failed to update pass status")
		return
	}
	c.String(200, "OK")
}

type Recommended struct {
	ID int64 `json:"id,omitempty"`
	Name   string `json:"name"`
	Date   string `json:"date"`
	Amount string `json:"amount"`
	MasterID int64 `json:"master_id"`
}

func GetRecommended(c *gin.Context) {
	company := c.MustGet("company")
	amount := c.Param("amount")
	var recoms []Recommended

	rows, err := DB.Query(`select account_master.name, c.date, c.amount from account_master
    								inner join cheques c on account_master.id = c.masterid 
									where account_master.companyid = $1 and amount = $2 and c.passed is false`,company,amount)

	if err!=nil{
		ErrorHandler(err, c, "failed")
		return
	}

	for rows.Next(){
		var recomend Recommended
		rerr := rows.Scan(&recomend.Name, &recomend.Date, &recomend.Amount)
		if rerr!= nil{
			ErrorHandler(err,c,"Failed scanning recommended");
			return
		}
		recoms = append(recoms, recomend)
	}

	c.JSON(200, recoms)
}


func GetAllPendingCheques(c *gin.Context){
	company := c.MustGet("company")
	rows, err := DB.Query(`select c.id, am.name, c.date, c.amount, c.masterid from account_master am 
							inner join cheques c on am.id = c.masterid where am.companyid = $1 and c.passed is false order by c.date desc`, company)

	if err!=nil{
		ErrorHandler(err, c, "Failed to get all pending cheques")
		return
	}

	var chqs []Recommended

	for rows.Next(){
		var chq Recommended
		readErr := rows.Scan(&chq.ID, &chq.Name, &chq.Date, &chq.Amount, &chq.MasterID)
		if readErr!=nil{
			ErrorHandler(err, c, "Failed while reading all pending cheques")
			return
		}
		chqs = append(chqs, chq)
	}
	c.JSON(200, chqs)

}


func GetDayBook(c *gin.Context){
	company := c.MustGet("company")
	startDate := c.Query("sd")
	endDate := c.Query("ed")

	if startDate != ""{
		if endDate==""{
			endDate = startDate
		}
	}else{
		startDate = time.Now().Format("2006-01-02")
		endDate = startDate
	}

	rows, err := DB.Query(`
		select journal.id, date, narration, refno,type,amount  from journal
			inner join posting
			on posting.journalid = journal.id
				where masterid in (
    				select distinct id from account_master where groupid in(
        				select id from master_groups where id != 1 and id!=2
       				)
    			)and journal.company_id = $1 and date>=$2 and date<=$3
			order by date, refno
	`, company, startDate, endDate)

	var journals []models.AJournal

	if err != nil{
		ErrorHandler(err, c, "Unable to read rows for journals")
		return
	}

	for rows.Next(){
		var journal models.AJournal
		rerr := rows.Scan(&journal.ID, &journal.Date,
			&journal.Narration, &journal.Refno, &journal.Type,&journal.Amount)
		if rerr != nil{
			ErrorHandler(rerr, c, "Scanning failed during journal reading")
			return
		}
		journals = append(journals, journal)
	}

	c.JSON(200, journals)

}

func DeleteJournal(c *gin.Context){

	jid := c.Param("jid")
	journal_id, err := strconv.Atoi(jid)
	if err!=nil{
		c.String(403, "Wrong journal id provided")
		return
	}

	tx, err := DB.Begin()

	if err!=nil{
		log.Println("Failed to initialize the transaction, exiting")
		c.String(500,"Some something occurred")
		return
	}

	_, readErr := tx.Exec(`DELETE FROM posting where journalid = $1`, journal_id)

	if readErr!=nil{
		log.Println("Failed to delete the journal")
		tx.Rollback()
		c.String(404,"No postings found")
		return
	}

	_, journalErr := tx.Exec(`DELETE FROM journal where id=$1`, journal_id)

	if journalErr!=nil{
		log.Println("Failed to delete the parent journal exiting")
		tx.Rollback()
		c.String(404, "No journal found")
		return
	}

	tx.Commit()

	c.String(200,"Delete successful")

}
