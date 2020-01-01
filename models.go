package main

import "database/sql"

// Master Structure for master
type Master struct {
	ID         int32          `json:"id"`
	CustID     sql.NullInt64  `json:"cust_id"`
	IsMaster   bool           `json:"is_master"`
	Name       string         `json:"name"`
	Address    sql.NullString `json:"address"`
	Area       sql.NullString `json:"area"`
	CreatedAt  sql.NullString `json:"created_at"`
	CompanyID  int32          `json:"company_id"`
	ChequeFlag int32          `json:"chq_flg"`
}

// Bank Structed for bank
type Bank struct {
	ID        int32          `json:"id"`
	Name      string         `json:"name"`
	CreatedAt sql.NullString `json:"created_at"`
}

type Company struct {
	ID   int32  `json:"id"`
	Name string `json:"name"`
	Year string `json:"year"`
}

type Group struct {
	ID       int32  `json:"id"`
	Name     string `json:"name"`
	CreateAt string `json:"create_at"`
}

type File struct {
	Location  string
	Original  string
	Filename  string
	Company   string
	CompanyID int64
}

type UploadCompanies struct {
	ID        int32  `json:"id"`
	Name      string `json:"name"`
	CompanyID int32  `json:"company_id"`
}
