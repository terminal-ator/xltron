package services

import (
	"database/sql"
	"fmt"
	"github.com/kierdavis/dateparser"
	"github.com/terminal-ator/xltron/models"
	"log"
	"strconv"
	"strings"
)

type UploadService interface {
	ImportBasicSales(excelMap models.MapType, keys map[string]string,company string,
		salesID int64, companyID int64 ) (int, int, error)
}

type uploadService struct{
	DB *sql.DB
}

func ConstructUploadService(db *sql.DB) UploadService{
	return &uploadService{DB: db}
}

type LedgerRow struct {
	Name      string  `json:"name"`
	Amount    float64 `json:"amount"`
	BillNo    string  `json:"bill_no"`
	DateCol   string  `json:"date"`
	Company   string  `json:"company"`
	CompanyID int64   `json:"company_id"`
	MasterID  int64   `json:"master_id"`
}
// Needs updating to new logic
func (u *uploadService) ImportBasicSales(excelMap models.MapType, keys map[string]string, company string,
											salesID int64, companyID int64 ) (int, int, error){
	var successCount = 0
	var errorCount = 0
	var nameCol = keys["name"]
	var amountCol = keys["amount"]
	var billNoCol = keys["billno"]
	var dateCol = keys["date"]
	amountArray := excelMap[amountCol]
	nameArray := excelMap[nameCol]
	dateArray := excelMap[dateCol]
	billNoArray := excelMap[billNoCol]

	for index := range amountArray {
		var LRow LedgerRow
		LRow.Name = strings.ToUpper(nameArray[index])
		LRow.Amount, _ = strconv.ParseFloat(amountArray[index], 32)
		parser := dateparser.Parser{DayFirst: true, Fuzzy: true}
		t, derr := parser.Parse(dateArray[index])
		if derr != nil {
			log.Println("Error while parsing date")
			return 0, 0, derr
		}
		LRow.DateCol = t.Format("2006-01-02")
		LRow.BillNo = billNoArray[index]
		LRow.Company = company
		LRow.CompanyID = companyID
		var custID int64
		if err := u.DB.QueryRow(`Select a.id,a.masterid from accounts a 
				inner join account_master b on a.masterid = b.id where LOWER(a.name) = LOWER($1)
				and b.companyid =$2`, LRow.Name, LRow.CompanyID).Scan(&LRow.MasterID, &custID); err != nil {
			log.Println(err)
			fmt.Println("Name not found")
			errorCount++
			_, saveError := u.DB.Exec(`Insert into error_ledger(master_name, ledger_type,
				 ledger_date, ledger_no, to_customer, company_id, interfaceCode,associated_id) values($1, $2, $3, $4, $5, $6, $7,$8)`,
				LRow.Name, LRow.Company, LRow.DateCol, LRow.BillNo, LRow.Amount, LRow.CompanyID, company, salesID)
			if saveError != nil {
				fmt.Println("IN save error")
				return 0, 0, saveError
			}
		} else {
			saveError := u.SaveFileToJournal(LRow, custID, salesID)
			if saveError != nil {
				fmt.Println("In save ledger")
				return 0, 0, saveError
			}
			successCount++
		}
	}

	log.Printf("Got sales with Success: %d and errors: %d", successCount, errorCount)
	return successCount, errorCount, nil

}

func (u *uploadService) SaveFileToJournal(row LedgerRow, masterID int64, saleID int64) error{
	var journal models.AJournal
	tx, _ := u.DB.Begin()
	// create a journal entry
	journal.CompanyID = int32(row.CompanyID)
	journal.Date = row.DateCol
	journal.Narration = "Invoice: " + row.BillNo +" for " + row.Name + " in " + row.Company
	journal.Refno = row.BillNo
	journal.Type = "Invoice"
	err := journal.SaveNoSttmt(tx)
	if err != nil {
		log.Println("Error in creating journal:")
		log.Printf(err.Error())
		tx.Rollback()
		return err
	}
	// create double entry
	var post1, post2 models.Posting
	post1.JournalID = journal.ID
	post1.AssetType = "Rs."
	post1.CompanyID = journal.CompanyID
	post1.MasterID = int32(masterID)
	post1.Amount = -row.Amount
	err = post1.Save(tx)
	log.Println("Saved first posting")
	if err != nil {
		tx.Rollback()
		return err
	}
	post2.JournalID = journal.ID
	post2.AssetType = "Rs."
	post2.CompanyID = journal.CompanyID
	post2.MasterID = int32(saleID)
	post2.Amount = row.Amount
	err = post2.Save(tx)
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}