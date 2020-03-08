package main

import (
	"github.com/gin-gonic/gin"
)

type ChqCreateReq struct {
	PostDate string `json:"post_date"`
	ChqNo    string `json:"chq_no"`
	BankName string `json:"bank_name"`
	ChqDate  string `json:"chq_date"`
	Name     string `json:"name"`
	Amount   string `json:"amount"`
	BankID   int64  `json:"bank_id"`
}

type Beat struct {
	ID        int64  `json:"id"`
	Name      string `json:"name"`
	Addn1     string `json:"addn1"`
	Addn2     string `json:"addn2"`
	CompanyID int64  `json:"company_id"`
	ShortName string `json:"short_name"`
}

// const FetchBeats
func FetchBeats(c *gin.Context) {

	company := c.Param("company")
	var beats []Beat
	rows, err := DB.Query(`SELECT id, name, addn1, addn2, companyid,short_name
							FROM beat where companyid = $1`, company)

	if err != nil {
		ErrorHandler(err, c, "Failed during query")
		return
	}

	// scan beats

	for rows.Next() {
		var beat Beat
		err := rows.Scan(&beat.ID, &beat.Name, &beat.Addn1,
			&beat.Addn2, &beat.CompanyID, &beat.ShortName)
		if err != nil {
			ErrorHandler(err, c, "Failed during scan")
			return
		}
		beats = append(beats, beat)
	}

	c.JSON(200, beats)
}
