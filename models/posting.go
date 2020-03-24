package models

import (
	"database/sql"
	"fmt"
	"log"
	"strings"
)

type Posting struct {
	ID        int32   `json:"id"`
	MasterID  int32   `json:"master_id"`
	JournalID int32   `json:"journal_id"`
	AssetType string  `json:"asset_type"`
	Amount    float64 `json:"amount"`
	CompanyID int32   `json:"company_id"`
	Debit     float64 `json:"debit"`
	Credit    float64 `json:"credit"`
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

func FetchPosting(trx *sql.Tx, postingID int32) (*Posting, error) {
	var posting Posting

	res := trx.QueryRow(`SELECT * FROM posting where id=$1`, postingID)

	err := res.Scan(&posting.ID, &posting.MasterID, &posting.JournalID, &posting.AssetType,
		&posting.Amount, &posting.CompanyID)
	if err != nil {
		log.Printf("Error while scanning postings %s", err.Error())
		return &posting, err
	}
	return &posting, nil
}

func FetchPostings(db *sql.Tx, journalID int32) []Posting {

	var postings []Posting
	row, err := db.Query(`SELECT * from posting where journalid =$1`, journalID)

	if err != nil {
		log.Println("Failed due to :", err.Error())
		return nil
	}

	for row.Next() {
		var temp Posting
		err := row.Scan(&temp.ID, &temp.MasterID, &temp.JournalID, &temp.AssetType, &temp.Amount, &temp.CompanyID)
		if err != nil {
			log.Println("Failed here")
			return nil
		}
		postings = append(postings, temp)
	}

	if err != nil {
		log.Println("Failed to find posting", err.Error())
		return nil
	}
	return postings
}

func (p *Posting) Update(tx *sql.Tx) error {

	old, err := FetchPosting(tx, p.ID)

	if err != nil {
		return err
	}

	var paramValues []interface{}
	paramCount := 1
	var paramNames []string
	updateQuery := `Update posting set `

	if old.Amount != p.Amount {
		tmpString := fmt.Sprintf("amount=$%d", paramCount)
		paramCount += 1
		paramValues = append(paramValues, p.Amount)
		paramNames = append(paramNames, tmpString)
	}

	if old.MasterID != p.MasterID {
		tmpString := fmt.Sprintf("masterid = $%d", paramCount)
		paramCount += 1
		paramValues = append(paramValues, p.MasterID)
		paramNames = append(paramNames, tmpString)
	}

	paramQuery := strings.Join(paramNames, ",")
	updateQuery += paramQuery
	updateQuery += fmt.Sprintf(" WHERE id = $%d", paramCount)
	paramValues = append(paramValues, p.ID)

	log.Printf("The update Query for postings : %s", updateQuery)

	if len(paramValues) > 1 {
		_, err = tx.Exec(updateQuery, paramValues...)
		if err != nil {
			log.Println("Error while updating posting: ", err.Error())
			return err
		}
	} else {
		log.Printf("\n No fields to update in postings")
		return nil
	}

	return nil
}
