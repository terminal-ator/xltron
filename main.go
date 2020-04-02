package main

import (
	"database/sql"
	"log"
	"time"

	"github.com/gin-contrib/cors"

	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
)

var DB *sql.DB

func companyExtractor() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		t := time.Now()
		company := ctx.GetHeader("Authorization")
		ctx.Set("company", company)
		yearID := ctx.GetHeader("yearID")
		ctx.Set("yearID", yearID)
		log.Printf("Got the company: %s", company)
		ctx.Next()
		latency := time.Since(t)
		log.Printf("Latency for request : %d ", latency)
	}
}

func main() {
	connStr := "user=postgres password=colgate dbname=postgres sslmode=disable"
	var err error
	DB, err = sql.Open("postgres", connStr)

	if err != nil {
		log.Fatal(err)
	}

	r := gin.Default()
	config := cors.DefaultConfig()
	config.AllowAllOrigins = true
	config.AllowHeaders = append(config.AllowHeaders, "Authorization", "yearid")
	r.Use(cors.New(config))
	r.Use(companyExtractor())
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
	r.GET("/accounts", GetAllAccounts)

	// new journal logic
	r.GET("/postings/:id", GetPostingForID)
	r.GET("/statement/download/:bank", DownloadStatement)
	r.POST("/statement/", saveStatementToCustID)
	r.POST("/statement/import", PostStatementUpload)
	r.GET("/statement/template", GetStatementTemplate)
	r.GET("/journal/:id", GetJournal)
	r.POST("/journal", MakeJournal)

	r.GET("/saveid", updateCUSTID)

	// masters
	r.POST("/master/:company", PostCreateMaster)
	r.PUT("/master/:company", UpdateMaster)

	r.GET("/beat/:company", FetchBeats)
	r.GET("/years", GetCompanyYears)

	// error handler
	r.GET("/errors/:company", GetErrorLedgers)
	r.POST("/errors", MergeErrors)
	r.Run(":8080") // listen and serve on 0.0.0.0:8080
}
