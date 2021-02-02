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

	router := gin.Default()
	r := router.Group("/api")
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

	handlers.InitStatement(r, DB)
	r.GET("/groups", GetAllGroups)
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
	handlers.InitCompany(DB, r)

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
	companyService := api.ConstructCompanyService(DB)
	postingHandler := handlers.ConstructPostingHandler(&companyService, &postingService)
	r.GET("/postings/:id", postingHandler.GetJournalsForID)
	r.DELETE("/postings/:id", postingHandler.DeleteJournalID)
	r.GET("/journal/:id", GetJournal)
	r.GET("/journals", GetDayBook)
	r.POST("/journal", postingHandler.UpdateJournal)
	r.GET("/saveid", updateCUSTID)
	handlers.InitMaster(r, DB)
	r.GET("/beat/:company", FetchBeats)
	r.GET("/years", GetCompanyYears)
	// error handler
	r.GET("/errors/:company", GetErrorLedgers)
	r.POST("/errors", MergeErrors)
	// users logic
	handlers.InitUserHandlers(DB, r)
	router.Run(":8080") // listen and serve on 0.0.0.0:8080
}
