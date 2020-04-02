package models

import (
	"database/sql"
	"github.com/huandu/go-sqlbuilder"
	"log"
)

type CompanyYears struct {
	ID         int32  `json:"id",db:"id"`
	StartDate  string `json"start_date",db:"startDate"`
	EndDate    string `json:"end_date",db:"endDate"`
	YearString string `json:"year_string",db:"yearstring"`
	CompanyID  int32  `json:"company_id",db:"company_id"`
}

var yearStruct = sqlbuilder.NewStruct(new(CompanyYears))

func FetchYears(db *sql.DB, companyID int32) []CompanyYears {
	sb := yearStruct.SelectFrom("company_years")
	sb.Where(sb.Equal("companyid", companyID))
	sql, args := sb.BuildWithFlavor(sqlbuilder.PostgreSQL)
	var years []CompanyYears

	rows, err := db.Query(sql, args...)
	if err != nil {
		log.Println("Failed to process years")
		return nil
	}
	defer rows.Close()
	for rows.Next() {
		var year CompanyYears
		rerr := rows.Scan(yearStruct.Addr(&year)...)
		if rerr != nil {
			log.Println("Failed to read structs: ", rerr.Error())
			return nil
		}
		years = append(years, year)
	}
	return years
}
