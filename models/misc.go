package models

import "database/sql"

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
	ID          int32         `json:"id"`
	Date        string        `json:"date"`
	JournalID   int32         `json:"journal_id"`
	Narration   string        `json:"narration"`
	RefNo       string        `json:"ref_no"`
	StatementID sql.NullInt64 `json:"stat_id"`
	Amount      float32       `json:"amount"`
}

type ErrorSales struct {
	Name          string `json:"name"`
	InterfaceCode string `json:"interface_code"`
}
