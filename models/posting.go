package models

import (
	"database/sql"
	"log"
)

type Posting struct {
	ID        int32   `json:"id"`
	MasterID  int32   `json:"master_id"`
	JournalID int32   `json:"journal_id"`
	AssetType string  `json:"asset_type"`
	Amount    float64 `json:"amount"`
	CompanyID int32   `json:"company_id"`
}

func (post *Posting) Save(db *sql.Tx) error {

	row := db.QueryRow(`INSERT INTO posting(masterID, journalID, assest_type,amount, company_id)
		values($1, $2, $3, $4, $5) returning id`, post.MasterID, post.JournalID, post.AssetType, post.Amount, post.CompanyID)

	err := row.Scan(&post.ID)
	if err != nil {
		log.Println(`Error while creating postings`, err.Error())
		return err

	}

	return nil
}
