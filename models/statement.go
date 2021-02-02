// Handle database Mappings
package models

import (
	"database/sql"
	"fmt"
	"log"
)

// Handles statement model
type Statement struct {
	ID        int32           `json:"id"`
	Narration string          `json:"narration"`
	Date      string          `json:"date"`
	RefNo     string          `json:"ref_no"`
	CreatedAt string          `json:"created_at"`
	CustID    sql.NullInt64   `json:"cust_id"`
	Master    Master          `json:"master"`
	Withdrawl sql.NullFloat64 `json:"withdrawl"`
	Deposit   sql.NullFloat64 `json:"deposit"`
	BankID    int32           `json:"bank_id"`
	Bank      Bank            `json:"bank"`
	Company   Company         `json:"company"`
	CompanyID int64           `json:"company_id"`
}

func (statement *Statement) SqlSelectByID(db *sql.DB, id int64) error {

	row := db.QueryRow(selectQuery, id)
	err := row.Scan(&statement.ID, &statement.Narration, &statement.Date, &statement.RefNo, &statement.CreatedAt,
		&statement.CustID, &statement.Deposit, &statement.Withdrawl, &statement.BankID,
		&statement.CompanyID)
	return err

}

// func (Statement *Statement) Save(db *sql.DB) error{

// 	// create update query
// 	if(Statement.ID !=nil){

// 	}
// }

func (statement *Statement) Update(db *sql.Tx, cust_id int32) error {

	// updateQuery := UpdateQueryForParam("statement", property, fmt.Sprintf("id = %d", statement.ID))
	updateQuery := `UPDATE statement set cust_id = $1 where id = $2`
	log.Println(updateQuery)
	_, err := db.Exec(updateQuery, cust_id, statement.ID)
	return err
}

func UpdateQueryForParam(tablename string, column string, Param string) string {
	return fmt.Sprintf("Update %s set %s = $1 where %s", tablename, column, Param)
}

const selectQuery = `
	Select
		id, narration, date, refno, created_at, cust_id, deposit, withdrawl,
		bank_id, company_id
		from statement where id=$1
`
