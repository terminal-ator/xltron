package main

import (
	"database/sql"
	"log"

	"github.com/gin-contrib/cors"

	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
)

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

var DB *sql.DB

func main() {
	connStr := "user=postgres password=colgate dbname=postgres"
	var err error
	DB, err = sql.Open("postgres", connStr)

	if err != nil {
		log.Fatal(err)
	}

	r := gin.Default()
	r.Use(cors.Default())
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	r.GET("/statements/:bank", func(c *gin.Context) {

		bank_id := c.Param("bank")
		var statements *sql.Rows
		var dbError error
		if bank_id == "all" {
			statements, dbError = DB.Query(ALL_STATEMENT)
		} else {
			statements, dbError = DB.Query(BANK_WISE_STATEMENT, bank_id)
		}

		stats := make([]Statement, 0)
		// fmt.Println(statements)
		for statements.Next() {
			var stat Statement
			if err := statements.Scan(&stat.ID,
				&stat.Narration,
				&stat.Date,
				&stat.RefNo,
				&stat.CreatedAt,
				&stat.CustID,
				&stat.Deposit,
				&stat.Withdrawl,
				&stat.BankID,
				&stat.CompanyID); err != nil {
				log.Fatal(err)
			}
			log.Println(stat.CustID)
			master := DB.QueryRow(`Select id, cust_id, name from masters 
			where cust_id=$1 and company_id=$2 and isMaster=1`, stat.CustID, stat.CompanyID)
			var nMaster Master
			dbNError := master.Scan(&nMaster.ID, &nMaster.CustID, &nMaster.Name)
			if dbNError != nil {
				if dbNError != sql.ErrNoRows {
					log.Fatal(dbNError)
				}
			}
			if dbNError == nil {

				master.Scan()
				stat.Master = nMaster
			}
			bank := DB.QueryRow("Select id, name from banks where id=$1", stat.BankID)
			var nBank Bank
			bankError := bank.Scan(&nBank.ID, &nBank.Name)
			if bankError != nil {
				if bankError != sql.ErrNoRows {
					log.Fatal(bankError)
				}
			}
			stat.Bank = nBank
			// fmt.Println(stat.ID)
			stats = append(stats, stat)
		}
		if dbError != nil {
			log.Fatal(dbError)
		}
		c.JSON(200, gin.H{
			"statements": stats,
		})
	})
	r.GET("/cstatements/:company", GetConsolidatedStatements)
	r.GET("/masters/:company", GetAllMasters)
	r.POST("/statements", PostMasterToStatement)
	r.GET("/banks/:company", GetAllBanks)
	r.GET("/companies", GetAllCompanies)
	r.GET("/groups", GetAllGroups)
	r.POST("/masters", CreateMaster)
	r.POST("/upload", PostFileUploadDirect)
	r.POST("/parseUpload", PutCsvToDB)
	r.GET("/uplcompany/:company", GetCompanies)
	r.Run() // listen and serve on 0.0.0.0:8080
}
