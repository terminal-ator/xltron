package models

import (
	"database/sql"
	"github.com/huandu/go-sqlbuilder"
	"log"
)

type Cheque struct {
	ID        int32   `json:"id",db:"id"`
	Date      string  `json:"date",db:"date"`
	MasterID  int32   `json:"master_id",db"masterid"`
	JournalID int32   `json:"journal_id, omitempty",db:"journal_id""`
	Amount    float64 `json:"amount",db:"amount"`
	Passed    bool    `json:"passed",db:"passed"`
	Type string `json:"type"`
	Name string `json:"name"`
	Number string `json:"number"`
	MasterName string `json:"master_name"`
}

var chequeStruct = sqlbuilder.NewStruct(new(Cheque))

func FetchChequesByMasterID(db *sql.DB, masterID int32) []Cheque {
	var cheques []Cheque
	rows, err := db.Query(`Select id, date, masterid, amount, passed, type, name, number from cheques where masterid=$1 order by date desc, id desc`, masterID)
	if err != nil {
		log.Println("Failed to process cheques", err)
		return nil
	}
	defer rows.Close()

	for rows.Next() {
		var chq Cheque
		rerr := rows.Scan(&chq.ID, &chq.Date, &chq.MasterID, &chq.Amount, &chq.Passed, &chq.Type, &chq.Name, &chq.Number)
		if rerr != nil {
			log.Println("Faield to read cheque structs", rerr.Error())
			return nil
		}
		cheques = append(cheques, chq)
	}

	return cheques
}

func (c *Cheque) Save(db *sql.DB) error {
	row := db.QueryRow(`insert into cheques(date, masterid, amount, type, name, number) values($1, $2, $3, $4, $5, $6) returning id`,
		c.Date, c.MasterID, c.Amount, c.Type, c.Name, c.Number)
	err := row.Scan(&c.ID)
	if err != nil {
		println("Error saving cheque", err.Error())
		return err
	}
	return nil
}

func SaveCheques(db *sql.DB, cheques []Cheque) error {
	for _, chq := range cheques {
		err := chq.Save(db)
		if err != nil {
			log.Println("Failed to save cheques", err.Error())
			return err
		}
	}
	return nil
}
