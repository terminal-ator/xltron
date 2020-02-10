package models

import (
	"database/sql"
	"log"
)

type AJournal struct {
	ID          int32  `json:"id"`
	Date        string `json:"string"`
	Narration   string `json:"narration"`
	Refno       string `json:"ref_no"`
	CompanyID   int32  `json:"company_id"`
	Type        string `json:"type"`
	StatementID int32  `json:"sttmnt_id"`
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
