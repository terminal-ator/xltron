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

type Ledger struct {
	ID           int32          `json:"id"`
	CustID       int32          `json:"cust_id"`
	LedgerType   string         `json:"ledger_type"`
	LedgerDate   string         `json:"ledger_date"`
	LedgerNo     sql.NullString `json:"ledger_no"`
	AssocID      sql.NullInt64  `json:"assoc_id"`
	ToCustomer   sql.NullInt64  `json:"to_cust"`
	FromCustomer sql.NullInt64  `json:"from_cust"`
	CompanyID    int32          `json:"company_id"`
}

type Journal struct {
	ID          int32  `json:"id"`
	Date        string `json:"string"`
	JournalID   int32  `json:"journal_id"`
	Narration   string `json:"narration"`
	RefNo       string `json:"ref_no"`
	StatementID int32  `json:"stat_id"`
}
