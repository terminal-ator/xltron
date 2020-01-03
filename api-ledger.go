package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"strconv"

	"github.com/gin-gonic/gin"
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
	var File File

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
	var File File

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
		return
	}
	// marshal headers to json

	var keys = map[string]string{
		"name":   "name",
		"date":   "date",
		"amount": "amount",
		"billno": "billno",
	}

	sCnt, eCnt, err := SaveCsvToDB(csvFileName, keys, company, int64(x))

	if err != nil {
		c.String(http.StatusInternalServerError, err.Error())
	}
	// headerString, _ := json.Marshal(&fileResponse)

	c.JSON(http.StatusOK, gin.H{
		"sucess": sCnt,
		"error":  eCnt,
	})
}

func PutCsvToDB(c *gin.Context) {

	// parse the body to gain insights
	var fileRequest FileRequest
	err := c.BindJSON(&fileRequest)

	if err != nil {
		c.String(http.StatusBadRequest, err.Error())
	}

	company := c.Query("company")
	companyID, _ := strconv.Atoi(c.Query("id"))

	// parse the body to file request

	// call the csvToDb and get results
	sCnt, eCnt, err := SaveCsvToDB(fileRequest.Filename, fileRequest.Keys, company, int64(companyID))

	if err != nil {
		fmt.Println("Error:", err.Error())
		c.String(http.StatusInternalServerError, err.Error())
		return
	}

	response := map[string]interface{}{
		"success": sCnt,
		"errors":  eCnt,
	}

	c.JSON(http.StatusOK, response)

}

type LedgerEntry struct {
	CustID int64 `json:"cust_id"`
	Cash   int64 `json:"cash"`
}

type LedgerRequest struct {
	Date    string        `json:"date"`
	Ledgers []LedgerEntry `json:"ledger_entry"`
}

func PutCashToLedger(c *gin.Context) {
	company := c.Query("company")
	var Ledger LedgerRequest
	err := c.BindJSON(&Ledger)

	if err != nil {
		c.String(http.StatusBadRequest, err.Error())
	}

	for _, ledger := range Ledger.Ledgers {
		_, err := DB.Exec(`Insert into ledger(cust_id,from_customer,company_id) values($1,$2,$3)`, ledger.CustID, ledger.CustID, company)

		if err != nil {
			log.Print(err.Error())
			c.String(http.StatusInternalServerError, err.Error())
		}
	}

	c.String(http.StatusOK, "All OK")
}
