package main

import (
	"github.com/360EntSecGroup-Skylar/excelize"
	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"github.com/kierdavis/dateparser"
	"io"
	"log"
	"os"
	"strconv"
)

type MapType map[string][]string

type KeyType struct {
	Date      string
	Narration string
	RefNo     string
	Deposit   string
	WithDrawl string
}

func PostStatementUpload(c *gin.Context) {

	file, handler, err := c.Request.FormFile("upload")
	if err != nil {
		ErrorHandler(err, c, "Failed while reading file from request")
		return
	}
	defer file.Close()
	f, err := os.OpenFile("./uploads/"+handler.Filename, os.O_WRONLY|os.O_CREATE, 0666)
	if err != nil {
		ErrorHandler(err, c, "Failed when opening the file")
		return
	}
	defer f.Close()
	io.Copy(f, file)
	bank := c.Query("bank")
	company := c.Query("company")
	bankId, _ := strconv.Atoi(bank)
	companyId, _ := strconv.Atoi(company)
	excelMap, err := ExcelToMap(f.Name())

	if err != nil {
		ErrorHandler(err, c, "Failed when making excel map")
		return
	}
	keys := getKeys()
	err = SaveMapToDB(excelMap, keys, bankId, companyId)
	if err != nil {
		ErrorHandler(err, c, "Failed saving statements")
		return
	}

	c.String(200, "Import Completed. Number of entries will come next")

}

func GetStatementTemplate(c *gin.Context) {
	filepath := "./files/template_statement.xlsx"
	c.Header("Content-Description", "File Transfer")
	c.Header("Content-Transfer-Enconding", "binary")
	c.Header("Content-Dispositon", "attachment; filename=template_statement.xlsx")
	c.Header("Content-Type", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
	c.File(filepath)
}

func SaveMapToDB(excelMap MapType, keys KeyType,
	bankId int, companyId int) error {
	dates := excelMap[keys.Date]
	narrations := excelMap[keys.Narration]
	refNos := excelMap[keys.RefNo]
	deposits := excelMap[keys.Deposit]
	withdrawls := excelMap[keys.WithDrawl]
	importID := uuid.New()
	tx, _ := DB.Begin()
	for i := range dates {
		withdrawl, _ := strconv.ParseFloat(withdrawls[i], 64)
		deposit, _ := strconv.ParseFloat(deposits[i], 64)
		parser := dateparser.Parser{DayFirst:true, Fuzzy:true}
		t, derr := parser.Parse(dates[i])
		if derr!=nil{
			log.Println("Failed to parse the date", derr.Error())
			tx.Rollback()
			return derr
		}
		date := t.Format("2006-01-02")
		if withdrawl != 0 {
			_, err := tx.Exec(`INSERT INTO 
    						statement(date, narration,  refno,withdrawl,bank_id,company_id,import_id)
    						values($1,$2,$3,$4,$5,$6,$7)`,
				date, narrations[i], refNos[i], withdrawl, bankId, companyId, importID.String())
			if err != nil {
				log.Println("Failed during insert in statement at index: ", i)
				log.Printf("\n Got the following error: %s", err.Error())
				tx.Rollback()
				return err
			}
		} else {
			_, err := tx.Exec(`INSERT INTO 
    						statement(date, narration,  refno, deposit,bank_id,company_id,import_id)
    						values($1,$2,$3,$4,$5,$6,$7)`,
				date, narrations[i], refNos[i], deposit, bankId, companyId, importID.String())
			if err != nil {
				log.Println("Failed during insert in statement at index: ", i)
				log.Printf("\n Got the following error: %s", err.Error())
				tx.Rollback()
				return err
			}
		}
	}
	tx.Commit()
	return nil

}

func getKeys() KeyType {
	var keys = KeyType{
		Date:      "date",
		Narration: "narration",
		RefNo:     "refno",
		Deposit:   "deposit",
		WithDrawl: "withdrawl",
	}
	return keys
}

func ExcelToMap(fileName string) (MapType, error) {
	f, err := excelize.OpenFile(fileName)
	if err != nil {
		log.Println("Error while opening excels file: ", err.Error())
		return nil, err
	}
	rows, err := f.GetRows("Sheet 1")
	if err != nil {
		log.Println("Error while reading sheet1", err.Error())
		return nil, err
	}
	var headers []string
	var excelMap map[string][]string
	excelMap = make(map[string][]string)
	for index, row := range rows {
		if index == 0 {
			for _, header := range row {
				headers = append(headers, header)
			}
			continue
		}
		for index, col := range row {
			excelMap[headers[index]] = append(excelMap[headers[index]], col)
		}
	}
	return excelMap, nil
}
