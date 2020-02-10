package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"strconv"
	"strings"

	"github.com/terminal-ator/xltron/models"
)

type ExcelRow struct {
	Date      string `xlsx:"column(date)"`
	Narration string `xlsx:"column(name)"`
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

func SaveFileToDB(filename string) {

}

func StoreFileToDB(file models.File) error {
	_, err := DB.Exec(CREATE_FILE, file.Location, file.Original, file.Filename, file.Company, file.CompanyID)
	return err
}

func SaveToLedger(row LedgerRow, custID int64) error {
	_, err := DB.Exec(INSERT_LEDGER, row.Name, row.Company,
		row.DateCol, row.BillNo, row.Amount, row.CompanyID, custID, row.MasterID)

	return err
}

func SaveToJournal(row LedgerRow, custID int32, saleID int32) error {

	var journal models.AJournal
	tx, _ := DB.Begin()
	// create a journal entry
	journal.CompanyID = int32(row.CompanyID)
	journal.Date = row.DateCol
	journal.Narration = "BILL: " + row.Company
	journal.Refno = row.BillNo

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
	post1.MasterID = custID
	post1.Amount = row.Amount

	err = post1.Save(tx)
	log.Println("Saved first posting")
	if err != nil {
		tx.Rollback()
		return err
	}

	post2.JournalID = journal.ID
	post2.AssetType = "Rs."
	post2.CompanyID = journal.CompanyID
	post2.MasterID = saleID
	post2.Amount = -row.Amount

	err = post2.Save(tx)

	if err != nil {
		tx.Rollback()
		return err
	}

	tx.Commit()

	return nil
}

// func SaveCsvToDB(filename string)
func SaveCsvToDB(filename string, keys map[string]string, company string, saleID int32, companyID int64) (int, int, error) {

	var successCount = 0
	var errorCount = 0

	// open csv file
	file, _ := os.Open(filename)
	defer file.Close()

	var nameCol = keys["name"]
	var amountCol = keys["amount"]
	var billNoCol = keys["billno"]
	var dateCol = keys["date"]

	// fmt.Println(nameCol)

	var csvToMap map[string][]string

	fileReader, _ := ioutil.ReadAll(file)
	// unmarshal the map
	err := json.Unmarshal(fileReader, &csvToMap)

	if err != nil {
		log.Fatal(err.Error())
		return 0, 0, err
	}

	// fmt.Printf("%v", csvToMap)

	// extract the names and amount
	amountArray := csvToMap[amountCol]
	nameArray := csvToMap[nameCol]
	dateArray := csvToMap[dateCol]
	billNoArray := csvToMap[billNoCol]

	// fmt.Println(nameArray)
	// fmt.Println(amountArray)

	// traverse the arrays and save to db
	for index := range amountArray {
		// get cust_id for the name
		var LRow LedgerRow
		LRow.Name = strings.ToUpper(nameArray[index])
		LRow.Amount, _ = strconv.ParseFloat(amountArray[index], 32)
		LRow.DateCol = dateArray[index]
		LRow.BillNo = billNoArray[index]
		LRow.Company = company
		LRow.CompanyID = companyID
		var custID int32

		if err := DB.QueryRow(`Select a.id,a.masterid from accounts a 
				inner join account_master b on a.masterid = b.id where a.name = $1
				and b.companyid =$2
		`,
			LRow.Name, LRow.CompanyID).Scan(&LRow.MasterID, &custID); err != nil {

			log.Println(err)
			fmt.Println("Name not found")
			errorCount++
			_, saveError := DB.Exec(`Insert into error_ledger(master_name, ledger_type,
				 ledger_date, ledger_no, to_customer, company_id, interfaceCode) values($1, $2, $3, $4, $5, $6, $7)`,
				LRow.Name, LRow.Company, LRow.DateCol, LRow.BillNo, LRow.Amount, LRow.CompanyID, company)

			if saveError != nil {
				fmt.Println("IN save error")
				return 0, 0, saveError
			}

		} else {

			// test
			// fmt.Println("Master found")

			saveError := SaveToJournal(LRow, custID, saleID)
			if saveError != nil {
				fmt.Println("In save ledger")
				return 0, 0, saveError
			}
			// save to db
			// app.App.DB.Create(&purchase)
			// app.App.DB.Create(&ledger)
			successCount++
		}

	}

	return successCount, errorCount, nil

}
