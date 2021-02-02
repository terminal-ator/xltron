package models

import (
	"database/sql"
	"fmt"
	"github.com/terminal-ator/xltron/interfaces"
	"log"
	"strings"
)

type AJournal struct {
	ID          int32     `json:"id"`
	Date        string    `json:"date"`
	Narration   string    `json:"narration"`
	Refno       string    `json:"ref_no"`
	CompanyID   int32     `json:"company_id"`
	Type        string    `json:"type"`
	StatementID int32     `json:"sttmnt_id"`
	Postings    []Posting `json:"postings"`
	Amount      float64   `json:"amount"`
}

func (j *AJournal) Save(db *sql.Tx) error {

	row := db.QueryRow(`Insert into journal
						(date, narration,refno,company_id,type,sttmt_id)
						values($1,$2,$3,$4,$5,$6) returning id`,
		j.Date, j.Narration, j.Refno, j.CompanyID, j.Type, j.StatementID)

	err := row.Scan(&j.ID)

	if err != nil {
		log.Println("Unable to create journal:", err.Error())
		return err
	}

	// j.ID = int32(id)

	return nil
}

func (j *AJournal) SaveNoSttmt(db *sql.Tx) error {

	row := db.QueryRow(`Insert into journal
						(date, narration,refno,company_id,type)
						values($1,$2,$3,$4,$5) returning id`,
		j.Date, j.Narration, j.Refno, j.CompanyID, j.Type)

	err := row.Scan(&j.ID)

	if err != nil {
		log.Println("Unable to create journal:", err.Error())
		return err
	}

	// j.ID = int32(id)

	return nil
}

func FetchJournal(db *sql.Tx, journalID int32) (AJournal, error) {
	var jrnl AJournal
	row := db.QueryRow(`SELECT id,date,narration,refno,company_id,type from journal where id = $1`, journalID)

	err := row.Scan(&jrnl.ID, &jrnl.Date, &jrnl.Narration, &jrnl.Refno, &jrnl.CompanyID, &jrnl.Type)

	if err != nil {
		log.Println("Failed")
		return jrnl, err
	}

	postings := FetchPostings(db, jrnl.ID)
	jrnl.Postings = postings

	return jrnl, nil

}

func (j *AJournal) MakeJournal(db *sql.Tx) error {

	// save the journal
	j.SaveNoSttmt(db)


	for _, postings := range j.Postings {
		postings.JournalID = j.ID
		postings.Save(db)
	}

	return nil
}

func (j *AJournal) ReSave(db interfaces.Queryable) error{
	_, err :=  db.Exec(`Insert into journal
						(id,date, narration,refno,company_id,type)
						values($1,$2,$3,$4,$5,$6) returning id`,
		j.ID,j.Date, j.Narration, j.Refno, j.CompanyID, j.Type)
	return  err

}

func (j *AJournal) UpdateJournalNew(db interfaces.Queryable) error{

	// delete the whole Journal and postings
	err := j.DeleteJournal(db)
	if err!=nil{
		log.Println("Failed to delete the journal", err.Error())
		return err
	}

	err = j.ReSave(db)

	if err!=nil{
		log.Println("Failed while saving the journal", err.Error())
		return err
	}

	// save all the postings.
	for _, postings := range j.Postings {
		postings.JournalID = j.ID
		pErr := postings.Save(db)
		if pErr!=nil{
			log.Println("Failed to save posting", pErr.Error())
			return pErr
		}
	}

	return nil

}


func (j *AJournal) DeleteJournal (db interfaces.Queryable) error{

	_, err := db.Exec(`Delete from posting where journalid=$1`, j.ID)
	if err!=nil{
		log.Println("No postings found", err.Error())
		return err
	}

	_, err = db.Exec(`Delete from journal where id = $1`, j.ID)
	if err!=nil{
		log.Println("Failed to delete journal,", err.Error())
		return err
	}
	return nil
}


func (j *AJournal) UpdateJournal(db *sql.Tx) error {

	oldJournal, err := FetchJournal(db, j.ID)

	if err != nil {
		return err
	}

	var paramValues []interface{}
	paramCount := 1
	var paramNames []string

	updateQuery := `Update journal set `

	if oldJournal.Date != j.Date {
		tmpString := fmt.Sprintf("date = $%d", paramCount)
		paramNames = append(paramNames, tmpString)
		paramValues = append(paramValues, j.Date)
		paramCount += 1
	}

	if oldJournal.Narration != j.Narration {
		tmpString := fmt.Sprintf("narration=$%d", paramCount)
		paramNames = append(paramNames, tmpString)
		paramValues = append(paramValues, j.Narration)
		paramCount += 1
	}

	if oldJournal.Refno != j.Refno {
		tmpString := fmt.Sprintf("refno=$%d", paramCount)
		paramNames = append(paramNames, tmpString)
		paramValues = append(paramValues, j.Refno)
		paramCount += 1
	}

	paramQuery := strings.Join(paramNames, ",")
	updateQuery += paramQuery
	updateQuery += fmt.Sprintf(" WHERE id = $%d", paramCount)
	paramValues = append(paramValues, j.ID)

	log.Printf("\n The update query for journal is : \n %s", updateQuery)

	if len(paramValues) > 1 {
		fmt.Println("Executing with the parameters", paramValues)
		_, err = db.Exec(updateQuery, paramValues...)
		if err != nil {
			return err
		}
	} else {
		log.Printf("\n No fields to update")
	}

	for _, postings := range j.Postings {
		if postings.ID == 0 {
			postings.JournalID = j.ID
			postings.Save(db)
		} else {

			postings.Update(db)
		}

	}
	return nil
}
