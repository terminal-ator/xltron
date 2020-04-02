package main

import (
	"database/sql"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/models"
)

type FileResponse struct {
	Filename string   `json:"file_name"`
	Headers  []string `json:"keys"`
}

type FileRequest struct {
	Filename string            `json:"file_name"`
	Keys     map[string]string `json:"keys"`
}

func PostFileUpload(c *gin.Context) {

	// parse the form
	// r.ParseMultipartForm(32 << 20)

	file, handler, err := c.Request.FormFile("upload")
	if err != nil {
		fmt.Println(err.Error())
		c.String(http.StatusBadRequest, "Failed reading the file")
		return
	}
	defer file.Close()

	//save the file
	// fmt.Fprintf(w, "%v", handler.Header)
	f, err := os.OpenFile("./uploads/"+handler.Filename, os.O_WRONLY|os.O_CREATE, 0666)
	if err != nil {
		fmt.Println(err)
		// w.WriteHeader(http.StatusBadRequest)
		c.String(http.StatusInternalServerError, err.Error())
		return
	}
	defer f.Close()
	io.Copy(f, file)

	// save to database
	company := c.Query("company")
	companyID := c.Query("id")
	var File models.File

	// save the file as json
	csvFileName, headers, err := CsvToMap("./uploads/" + handler.Filename)

	if err != nil {
		log.Fatalf("Error while processing the file: %s", err.Error())
		c.String(http.StatusInternalServerError, err.Error())
	}

	File.Filename = csvFileName
	File.Location = "./upload"
	File.Company = company
	x, _ := strconv.Atoi(companyID)
	File.CompanyID = int64(x)

	err = StoreFileToDB(File)

	if err != nil {
		c.String(http.StatusInternalServerError, err.Error())
		return
	}

	// marshal headers to json

	var fileResponse FileResponse

	fileResponse.Filename = csvFileName
	fileResponse.Headers = headers

	// headerString, _ := json.Marshal(&fileResponse)

	c.JSON(http.StatusOK, fileResponse)
}

func PostFileUploadDirect(c *gin.Context) {

	// parse the form
	// r.ParseMultipartForm(32 << 20)

	file, handler, err := c.Request.FormFile("upload")
	if err != nil {
		fmt.Println(err.Error())
		c.String(http.StatusBadRequest, "Failed reading the file")
		return
	}
	defer file.Close()

	//save the file
	// fmt.Fprintf(w, "%v", handler.Header)
	f, err := os.OpenFile("./uploads/"+handler.Filename, os.O_WRONLY|os.O_CREATE, 0666)
	if err != nil {
		fmt.Println(err)
		// w.WriteHeader(http.StatusBadRequest)
		c.String(http.StatusInternalServerError, err.Error())
		return
	}
	defer f.Close()
	io.Copy(f, file)

	// save to database
	company := c.Query("company")
	companyID := c.Query("id")
	sID := c.Query("sales")

	salesID, err := strconv.Atoi(sID)

	if err != nil {
		c.String(404, "Invalid request")
		log.Printf("BAD ID")
		return
	}

	var File models.File

	// save the file as json
	csvFileName, _, err := CsvToMap("./uploads/" + handler.Filename)

	if err != nil {
		log.Fatalf("Error while processing the file: %s", err.Error())
		c.String(http.StatusInternalServerError, err.Error())
	}

	File.Filename = csvFileName
	File.Location = "./upload"
	File.Company = company
	x, _ := strconv.Atoi(companyID)
	File.CompanyID = int64(x)

	err = StoreFileToDB(File)

	if err != nil {
		c.String(http.StatusInternalServerError, err.Error())
		log.Println("error while saving:", err.Error())
		return
	}
	// marshal headers to json

	var keys = map[string]string{
		"name":   "name",
		"date":   "date",
		"amount": "amount",
		"billno": "billno",
	}

	sCnt, eCnt, err := SaveCsvToDB(csvFileName, keys, company, int32(salesID), int64(x))

	log.Println(sCnt)
	if err != nil {
		log.Println("Error while saving", err.Error())
		c.String(http.StatusInternalServerError, err.Error())
		return
	}
	// headerString, _ := json.Marshal(&fileResponse)

	c.JSON(http.StatusOK, gin.H{
		"sucess": sCnt,
		"error":  eCnt,
	})
}

func PutCsvToDB(c *gin.Context) {

	// parse the body to gain insights
	// var fileRequest FileRequest
	// err := c.BindJSON(&fileRequest)

	// if err != nil {
	// 	c.String(http.StatusBadRequest, err.Error())
	// }

	// company := c.Query("company")
	// companyID, _ := strconv.Atoi(c.Query("id"))

	// // parse the body to file request

	// // call the csvToDb and get results
	// sCnt, eCnt, err := SaveCsvToDB(fileRequest.Filename, fileRequest.Keys, company, int64(companyID))

	// if err != nil {
	// 	fmt.Println("Error:", err.Error())
	// 	c.String(http.StatusInternalServerError, err.Error())
	// 	return
	// }

	// response := map[string]interface{}{
	// 	"success": sCnt,
	// 	"errors":  eCnt,
	// }

	// c.JSON(http.StatusOK, response)

}

type LedgerEntry struct {
	CustID int64 `json:"cust_id"`
	Cash   int64 `json:"cash"`
}

type LedgerRequest struct {
	Date    string        `json:"date"`
	Ledgers []LedgerEntry `json:"ledger_entry"`
}

func PostCashToLedger(c *gin.Context) {
	company := c.Param("company")
	companyID, _ := strconv.Atoi(company)
	var Ledger LedgerRequest
	err := c.BindJSON(&Ledger)

	if err != nil {
		c.String(http.StatusBadRequest, err.Error())
	}

	log.Println(Ledger)

	// get cash ledger for the company
	row := DB.QueryRow(`select id from account_master where groupid = 6 and companyid = $1`, companyID)
	var cashID int32
	err = row.Scan(&cashID)
	ErrorHandler(err, c)
	tx, _ := DB.Begin()
	var j models.AJournal
	j.Date = Ledger.Date
	j.CompanyID = int32(companyID)
	j.Narration = "Cash paid on" + Ledger.Date
	j.Refno = "cash entry, no ref req"
	j.Type = "Receipt"
	err = j.SaveNoSttmt(tx)
	if err != nil {
		log.Println(err.Error())
		c.String(500, "failed")
		tx.Rollback()
		return
	}

	var sumOfLedger = 0.0

	for _, ledger := range Ledger.Ledgers {
		// _, err := DB.Exec(`Insert into ledger(cust_id,ledger_type,ledger_date,from_customer,company_id) values($1,$2,$3,$4,$5)`, ledger.CustID, "Cash", Ledger.Date, ledger.Cash, companyID)

		// create a posting
		var p = &models.Posting{Amount: float64(-ledger.Cash), AssetType: "Rs.", CompanyID: int32(companyID), JournalID: j.ID, MasterID: int32(ledger.CustID)}

		err := p.Save(tx)
		if err != nil {
			log.Print(err.Error())
			tx.Rollback()
			c.String(http.StatusInternalServerError, err.Error())
			return
		}
		sumOfLedger += float64(ledger.Cash)
	}

	// create final post for cash
	var p = &models.Posting{Amount: sumOfLedger, AssetType: "Rs.", CompanyID: int32(companyID), JournalID: j.ID, MasterID: cashID}

	if err := p.Save(tx); err != nil {
		log.Println(err.Error())
		tx.Rollback()
		c.String(500, err.Error())
		return
	}
	tx.Commit()
	c.String(http.StatusOK, "All OK")
}

func GetLedgerForCustID(c *gin.Context) {
	cust_id := c.Query("cust_id")
	company := c.Query("company")
	var CustomerLedger []models.Ledger

	ledgers, err := DB.Query(GET_LEDGER, cust_id, company)
	if err != nil {
		log.Println("Error when executing query: ", err.Error())
		c.String(http.StatusInternalServerError, err.Error())
	}
	for ledgers.Next() {
		var tempLedger models.Ledger
		err := ledgers.Scan(&tempLedger.ID, &tempLedger.CustID, &tempLedger.LedgerType, &tempLedger.LedgerDate, &tempLedger.LedgerNo, &tempLedger.AssocID, &tempLedger.ToCustomer, &tempLedger.FromCustomer, &tempLedger.CompanyID)
		if err != nil {
			log.Println("Error while scanning: ", err.Error())
		}
		CustomerLedger = append(CustomerLedger, tempLedger)
	}
	c.JSON(http.StatusOK, CustomerLedger)
}

func GetPostingForID(c *gin.Context) {
	id := c.Param("id")
	yearID := c.MustGet("yearID")
	var journals []models.Journal

	rows, err := DB.Query(`SELECT 
					 a.id, b.date, b.id, b.narration, b.refno, b.sttmt_id,a.amount
					 FROM POSTING a
					 INNER JOIN
					 JOURNAL b on a.journalid = b.id
					 WHERE a.masterid = $1
					 AND b.date >= (select startdate from company_years where id = $2)
					 AND b.date <= (select enddate from company_years where id = $2 )
					 order by b.date desc`, id, yearID)
	ErrorHandler(err, c)

	for rows.Next() {
		var temp models.Journal
		err := rows.Scan(&temp.ID, &temp.Date, &temp.JournalID, &temp.Narration,
			&temp.RefNo, &temp.StatementID, &temp.Amount)
		ErrorHandler(err, c)
		journals = append(journals, temp)
	}
	c.JSON(200, journals)
}

type QuickRequest struct {
	Date   string  `json:"date"`
	ToFrom string  `json:"toFrom"`
	Type   string  `json:"Type"`
	CustID int32   `json:"cust_id"`
	Amount float64 `json:"amount"`
}

func PutQuickToLedger(c *gin.Context) {
	company := c.Param("company")
	var req QuickRequest
	err := c.BindJSON(&req)
	if err != nil {
		log.Print("Error while processing: ", err.Error())
		c.String(http.StatusBadRequest, err.Error())
	}
	var withdrawl, deposit float64
	log.Printf("To recived?: %s", req.ToFrom)
	if req.ToFrom == "To" {
		withdrawl = req.Amount
	} else {
		deposit = req.Amount
	}

	_, err = DB.Exec(`INSERT INTO LEDGER(cust_id, ledger_type, ledger_date, to_customer, from_customer, company_id) values($1,$2, $3, $4,$5,$6)`, req.CustID, req.Type, req.Date, withdrawl, deposit, company)
	if err != nil {
		log.Print("Error while saving: ", err.Error())
		c.String(http.StatusInternalServerError, "Failed")
	} else {
		c.String(http.StatusOK, "Passed")
	}
}

func QuickLedger(c *gin.Context) {
	company := c.Param("company")
	var req QuickRequest
	err := c.BindJSON(&req)
	if err != nil {
		ErrorHandler(err, c, "While parsing json")
		return
	}
	var amount float64
	if req.ToFrom == "To" {
		amount = req.Amount
	} else {
		amount = -req.Amount
	}
	companyID, err := strconv.Atoi(company)
	cID := int32(companyID)
	if err != nil {
		ErrorHandler(err, c, "While processing company id")
		return
	}
	row := DB.QueryRow(`select id from account_master where groupid = 6 and companyid = $1`, companyID)
	var cashID int32
	err = row.Scan(&cashID)

	if err != nil {
		ErrorHandler(err, c, "While finding the cash id")
		return
	}
	// create journal
	jrnl := &models.AJournal{
		Date:      req.Date,
		Narration: "Quick Add",
		Refno:     req.Type,
		CompanyID: cID,
		Type:      req.ToFrom,
	}

	tx, err := DB.Begin()

	if err != nil {
		ErrorHandler(err, c, "While creating transaction")
		return
	}

	terr := jrnl.SaveNoSttmt(tx)
	if terr != nil {
		ErrorHandler(terr, c, "While saving journal")
		tx.Rollback()
		return
	}

	// create postings
	posting1 := &models.Posting{
		MasterID:  req.CustID,
		JournalID: jrnl.ID,
		AssetType: "Rs.",
		Amount:    amount,
		CompanyID: cID,
	}

	perr := posting1.Save(tx)

	if perr != nil {
		ErrorHandler(perr, c, "Saving posting 1")
		tx.Rollback()
		return
	}

	posting2 := &models.Posting{
		MasterID:  cashID,
		JournalID: jrnl.ID,
		AssetType: "Rs.",
		Amount:    -amount,
		CompanyID: cID,
	}

	perr = posting2.Save(tx)

	log.Println("Saved the postings.")

	if perr != nil {
		ErrorHandler(perr, c, "Saving posting2")
		tx.Rollback()
		return
	}

	//commit
	tx.Commit()

	c.String(200, "Saved Successfully")
}

type ErrorLedger struct {
	ID            int32   `json:"id"`
	Name          string  `json:"name"`
	Type          string  `json:"type"`
	Date          string  `json:"date"`
	LedgerNo      string  `json:"ledger_no"`
	AssocID       int64   `json:"assoc_id"`
	Amount        float64 `json:"amount"`
	CompanyID     int32   `json:"company_id"`
	InterfaceCode string  `json:"i_code"`
}

func GetErrorLedgers(c *gin.Context) {

	company := c.Param("company")
	var errorLedgers []ErrorLedger

	rows, err := DB.Query(`Select id, master_name, ledger_type, 
		ledger_date, ledger_no, associated_id, to_customer, company_id, interfaceCode
		FROM error_ledger where company_id = $1`, company)

	if err != nil {
		c.String(500, "Failed while executing command")
		return
	}

	// make array of errors
	for rows.Next() {
		var temp ErrorLedger
		rErr := rows.Scan(&temp.ID, &temp.Name, &temp.Type, &temp.Date,
			&temp.LedgerNo, &temp.AssocID, &temp.Amount, &temp.CompanyID, &temp.InterfaceCode)
		if rErr != nil {
			log.Println(rErr.Error())
			c.String(500, "Failed to find result")
			return
		}
		errorLedgers = append(errorLedgers, temp)
	}

	c.JSON(200, errorLedgers)
}

//
//  Merge Error Ledger with a current user
//
type MergeErrorReq struct {
	CustID  int64 `json:"cust_id"`
	ErrorID int64 `json:"error_id"`
}

func MoveErrorToJournal(trx *sql.Tx, ledger ErrorLedger, req MergeErrorReq) {

}

func MergeErrors(c *gin.Context) {

	// bind the req
	var req MergeErrorReq
	c.BindJSON(&req)

	// fetch error ledger for id
	var ledger ErrorLedger

	row := DB.QueryRow(`Select master_name, interfacecode,
	associated_id, to_customer, ledger_no,company_id,ledger_date
	FROM error_ledger where id=$1`, req.ErrorID)

	err := row.Scan(&ledger.Name, &ledger.InterfaceCode, &ledger.AssocID, &ledger.Amount, &ledger.LedgerNo,
		&ledger.CompanyID, &ledger.Date)
	if err != nil {
		c.String(500, err.Error())
		log.Println(err.Error())
	}

	// add to accounts
	trx, err := DB.Begin()

	if err != nil {
		c.String(500, err.Error())
		log.Println(err.Error())
	}

	// create a account
	_, err = trx.Exec(`Insert into Accounts(name, interfacecode, masterid) values($1,$2,$3)`,
		ledger.Name, ledger.InterfaceCode, req.CustID)

	if err != nil {
		c.String(500, err.Error())
		log.Println("Failed to create account")
		log.Println(err.Error())
	}

	// make journal for the error entry
	journal := &models.AJournal{
		CompanyID: ledger.CompanyID,
		Date:      ledger.Date,
		Narration: "Bill of " + ledger.Name,
		Refno:     ledger.LedgerNo,
		Type:      "Bill",
	}

	err = journal.SaveNoSttmt(trx)

	if err != nil {
		c.String(500, err.Error())
		log.Println(err.Error())
	}

	// create posting for sales
	posting1 := &models.Posting{
		Amount:    -ledger.Amount,
		AssetType: "Rs.",
		CompanyID: ledger.CompanyID,
		JournalID: journal.ID,
		MasterID:  int32(ledger.AssocID),
	}

	err = posting1.Save(trx)
	if err != nil {
		c.String(500, err.Error())
		log.Println(err.Error())
		trx.Rollback()
		return
	}

	posting2 := &models.Posting{
		Amount:    ledger.Amount,
		AssetType: "Rs.",
		CompanyID: ledger.CompanyID,
		JournalID: journal.ID,
		MasterID:  int32(req.CustID),
	}

	err = posting2.Save(trx)
	if err != nil {
		c.String(500, err.Error())
		log.Println(err.Error())
		trx.Rollback()
		return
	}

	// remove from error ledgers
	_, err = trx.Exec(`Delete from error_ledger where id = $1`, req.ErrorID)

	if err != nil {
		c.String(500, err.Error())
		log.Println(err.Error())
		trx.Rollback()
		return
	}

	trx.Commit()
	// return 200
	c.String(200, "Completed")
}

func GetJournal(c *gin.Context) {

	jid := c.Param("id")

	// convert jid to number
	jourID, err := strconv.Atoi(jid)

	journalID := int32(jourID)

	if err != nil {
		ErrorHandler(err, c, "Invalid Key")
		return
	}
	tx, _ := DB.Begin()

	journals, err := models.FetchJournal(tx, journalID)

	if err != nil {
		ErrorHandler(err, c, "Errors fetching journals")
		return
	}
	c.JSON(200, journals)
}
