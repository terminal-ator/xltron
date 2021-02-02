package utils

import (
	"errors"
	"github.com/360EntSecGroup-Skylar/excelize"
	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/models"
	"log"
)

func ExtractCompany(c *gin.Context) (int64, error){
	company, has := c.Get("company")
	if !has{
		return 0, errors.New("no company found")
	}
	cmp := company.(float64)
	return int64(cmp),nil
}

func ExcelToMap(fileName string) (models.MapType, error) {
	f, err := excelize.OpenFile(fileName)
	if err != nil {
		log.Println("Error while opening excels file: ", err.Error())
		return nil, err
	}
	firstSheet := f.WorkBook.Sheets.Sheet[0].Name
	log.Println("The name of the sheet is", firstSheet)
	rows := f.GetRows(firstSheet)
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

func GetKeys() models.KeyType {
	var keys = models.KeyType{
		Date:      "date",
		Narration: "narration",
		RefNo:     "refno",
		Deposit:   "deposit",
		WithDrawl: "withdrawl",
	}
	return keys
}
