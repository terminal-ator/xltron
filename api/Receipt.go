package api

import (
	"database/sql"
	"github.com/google/uuid"
	"github.com/terminal-ator/xltron/models"
	"log"
)

type ReceiptEntry struct {
	MasterID int `json:"master_id"`
	Amount float64 `json:"amount"`
}

type ReceiptService interface {
	CreateReceipt(date string , company int,
		receiptID int, receipts []ReceiptEntry) error
}

type receiptService struct {
	DB *sql.DB
}

func ConstructReceiptService(db *sql.DB) receiptService{
	return receiptService{DB: db}
}

func (rs *receiptService) CreateReceipt(date string , company int,
	receiptID int, receipts []ReceiptEntry) error{

	tx, _ := rs.DB.Begin()
	 var j models.AJournal
	j.Date = date
	j.CompanyID = int32(company)
	j.Narration = "Cash receipt on "+date
	j.Refno = uuid.New().String()
	j.Type = "Receipt"

	err := j.SaveNoSttmt(tx)
	if err!=nil{
		log.Println(err.Error())
		tx.Rollback()
		return err
	}

	var sum = 0.0
	for _, rec := range receipts{

		p := &models.Posting{
			Amount: rec.Amount,
			AssetType: "Rs.",
			CompanyID: int32(company),
			JournalID: j.ID,
			MasterID: int32(rec.MasterID),
		}

		postSaveError := p.Save(tx)
		if postSaveError!=nil{
			log.Println("Failed to save posting", postSaveError.Error())
			tx.Rollback()
			return postSaveError
		}

		sum += rec.Amount

	}

	p := &models.Posting{
		MasterID:  int32(receiptID),
		JournalID: j.ID,
		AssetType: "Rs.",
		Amount:    -sum,
		CompanyID: int32(company),
	}

	if err := p.Save(tx); err!=nil{
		log.Println("Failed to save fine posting", err.Error())
		tx.Rollback()
		return err
	}
	tx.Commit()

	return nil
}