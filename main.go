package main

import (
	"database/sql"
	"github.com/terminal-ator/xltron/api"
	"github.com/terminal-ator/xltron/handlers"
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
	connStr := "user=administrator password=Hxllx@wxrld dbname=postgres sslmode=disable"
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

	receiptService := api.ConstructReceiptService(DB)
	receiptHandler := handlers.ConstructReceiptHandler(&receiptService)

	r.POST("/ledger/:company", receiptHandler.PostReceipt)
	r.GET("/ledger", GetLedgerForCustID)
	r.PUT("/ledger/:company", QuickLedger)
	r.GET("/istats/:id", GetStatementById)
	r.POST("/upl", SalesUploadByExcel)

	// new account logic


	cheque := r.Group("/cheque")
	{
		cheque.POST("/", AddCheque)
		cheque.POST("/list", AddCheques)
		cheque.GET("/cheques/:masterid", GetCheques)
		cheque.POST("/toggle/:cid", TogglePassed)
		cheque.GET("/recommended/:amount", GetRecommended)
		cheque.GET("/pending", GetAllPendingCheques)
	}

	// company logic
	companyService := api.ConstructCompanyService(DB)
	companyHandler := handlers.ConstructCompanyHandle(&companyService)
	company := r.Group("/company")
	{
		company.POST("/", companyHandler.PostNewCompany)
	}

	// beat logic
	beatService := api.ConstructBeatService(DB)
	beatHandler := handlers.ConstructBeatHandler(&beatService)
	beat := r.Group("/beats")
	{
		beat.GET("/:companyID",beatHandler.GetBeatsAndGroups)
		beat.POST("/make/:name", beatHandler.PostQuickCreateBeat)
	}

	// new journal logic

	postingService := api.ConstructPostingService(DB)
	postingHandler := handlers.ConstructPostingHandler(&companyService, &postingService)

	r.GET("/postings/:id", postingHandler.GetJournalsForID)
	r.GET("/statement/download/:bank", DownloadStatement)
	r.POST("/statement/", saveStatementToCustID)
	r.POST("/statement/import", PostStatementUpload)
	r.GET("/statement/template", GetStatementTemplate)
	r.GET("/journal/:id", GetJournal)
	r.GET("/journals", GetDayBook)
	r.POST("/journal", MakeJournal)


	r.GET("/saveid", updateCUSTID)

	masterService := api.ConstructMasterService(DB)
	masterHandler := handlers.ConstructMasterHandler(&masterService)
	// masters
	//r.POST("/master/:company", PostCreateMaster)
	r.POST("/master/:company", masterHandler.PostCreateMaster)
	r.PUT("/master/:company", masterHandler.PutUpdateMaster)
	r.GET("/accounts", masterHandler.GetAllAccounts )

	r.GET("/beat/:company", FetchBeats)
	r.GET("/years", GetCompanyYears)

	// error handler
	r.GET("/errors/:company", GetErrorLedgers)
	r.POST("/errors", MergeErrors)




	r.Run(":8080") // listen and serve on 0.0.0.0:8080
}
