package main

import (
	"github.com/360EntSecGroup-Skylar/excelize"
	"log"
)

type MapType map[string][]string

type KeyType struct {
	Date      string
	Narration string
	RefNo     string
	Deposit   string
	WithDrawl string
}

func ExcelToMap(fileName string) (MapType, error) {
	f, err := excelize.OpenFile(fileName)
	if err != nil {
		log.Println("Error while opening excels file: ", err.Error())
		return nil, err
	}
	rows := f.GetRows("Sheet 1")
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
