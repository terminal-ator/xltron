package main

import (
	"database/sql"
	"log"

	"github.com/gin-contrib/cors"

	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
)

var DB *sql.DB

func main() {
	connStr := "user=postgres password=colgate dbname=postgres sslmode=disable"
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

	r.GET("/statements/:bank", FetchStatements)
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
	r.POST("/ledger/:company", PostCashToLedger)
	r.GET("/ledger", GetLedgerForCustID)
	r.PUT("/ledger/:company", QuickLedger)
	r.GET("/istats/:id", GetStatementById)

	// new account logic
	r.GET("/accounts/:company", GetAllAccounts)

	// new journal logic
	r.GET("/postings/:id", GetPostingForID)
	r.POST("/statement/", saveStatementToCustID)
	r.POST("/statement/import", PostStatementUpload)
	r.GET("/statement/template", GetStatementTemplate)
	r.GET("/journal/:id", GetJournal)
	r.POST("/journal", MakeJournal)

	r.GET("/saveid", updateCUSTID)

	// masters
	r.POST("/master/:company", PostCreateMaster)
	r.PUT("/master", UpdateMaster)

	r.GET("/beat/:company", FetchBeats)

	// error handler
	r.GET("/errors/:company", GetErrorLedgers)
	r.POST("/errors", MergeErrors)
	r.Run(":8080") // listen and serve on 0.0.0.0:8080
}
