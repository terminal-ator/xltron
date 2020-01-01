package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"strconv"
	"strings"
)

type ExcelRow struct {
	Date      string `xlsx:"column(date)`
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

func StoreFileToDB(file File) error {
	_, err := DB.Exec(CREATE_FILE, file.Location, file.Original, file.Filename, file.Company, file.CompanyID)
	return err
}

func SaveToLedger(row LedgerRow, custID int64) error {
	_, err := DB.Exec(INSERT_LEDGER, row.Name, row.Company,
		row.DateCol, row.BillNo, row.Amount, row.CompanyID, custID, row.MasterID)

	return err
}

// func SaveCsvToDB(filename string)
func SaveCsvToDB(filename string, keys map[string]string, company string, companyID int64) (int, int, error) {

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
		var custID int64

		if err := DB.QueryRow("Select id,cust_id from masters where name = $1 and company_id =$2",
			LRow.Name, LRow.CompanyID).Scan(&LRow.MasterID, &custID); err != nil {

			// log.Fatal(err)
			// fmt.Println("Name not found")
			errorCount++
			_, saveError := DB.Exec(`Insert into error_ledger(master_name, ledger_type,
				 ledger_date, ledger_no, to_customer, company_id) values($1, $2, $3, $4, $5, $6)`,
				LRow.Name, LRow.Company, LRow.DateCol, LRow.BillNo, LRow.Amount, LRow.CompanyID)

			if saveError != nil {
				fmt.Println("IN save error")
				return 0, 0, saveError
			}

		} else {

			// test
			// fmt.Println("Master found")

			saveError := SaveToLedger(LRow, custID)
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
