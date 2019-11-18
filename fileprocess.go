package main

type ExcelRow struct {
	Date      string `xlsx:"column(date)`
	Narration string `xlsx:"column(name)"`
}

func SaveFileToDB(filename string) {

}
