package handlers

import (
	"database/sql"
	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/api"
	"github.com/terminal-ator/xltron/auth"
	"github.com/terminal-ator/xltron/utils"
	"io"
	"log"
	"os"
	"strconv"
)

type StatementHandler struct {
	service api.StatementService
}

func ConstructStatementHandler(service api.StatementService) StatementHandler{
	return StatementHandler{
		service: service,
	}
}

func InitStatement(r *gin.RouterGroup, db *sql.DB){
	service := api.ConstructStatementService(db,"")
	handler := ConstructStatementHandler(&service)

	statements := r.Group("/statements")
	statements.Use(auth.CompanyTokenUser())
	statements.GET("/:bank/", handler.GetStatements)
	statements.POST("/", handler.MoveStatement)
	statements.POST("/import/:bank",handler.ImportStatements)
}

/*
 *  GET
 *  params - {bank}
 * query params- {sd: start date}, {ed: end date}
 */
func (sh *StatementHandler) GetStatements(c *gin.Context){

	company, err := utils.ExtractCompany(c)
	if err!=nil{
		auth.InvalidateUser(c)
		return
	}
	startDate := c.Query("sd")
	endDate := c.Query("ed")
	bank_id := c.Param("bank")
	bank, _ := strconv.Atoi(bank_id)
	log.Println("LASD,", startDate, endDate)

	stats, err := sh.service.FetchStatementsForBankDateWise(company, int64(bank), startDate, endDate)
	if err!=nil{
		c.JSON(500, utils.GeneralResponse{
			Code:    utils.INVALID_COMPANY,
			Message: "Invalid company selected",
			Data:    nil,
		})
		return
	}
	c.JSON(200, gin.H{
		"statements": stats,
	})
}

type SaveStatementRequest struct {
	StatementID int32 `json:"stat_id"`
	BankID      int32 `json:"bank_id"`
	CustID      int32 `json:"cust_id"`
	CompanyID   int32 `json:"company_id"`
}
func (sh *StatementHandler) MoveStatement(c *gin.Context){
	company, err := utils.ExtractCompany(c)
	if err!=nil{
		utils.HandleError(c, utils.INVALID_TOKEN)
		return
	}
	var req SaveStatementRequest
	err = c.BindJSON(&req)
	if err!=nil{
		utils.HandleError(c, utils.INVALID_REQUEST)
		return
	}
	err = sh.service.MoveFromStatementToVoucher(req.StatementID,req.CustID,
								int32(company), req.BankID)
	if err!=nil{
		utils.HandleError(c, utils.INVALID_REQUEST)
		return
	}
	c.JSON(200,utils.GeneralResponse{
		Code:    "ALL_OK",
		Message: "ALL OK",
		Data:    nil,
	})
}

func (sh *StatementHandler) ImportStatements(c *gin.Context){
	company, err := utils.ExtractCompany(c)
	if err!=nil{
		utils.HandleError(c,utils.INVALID_USER)
		return
	}
	file, handler, err := c.Request.FormFile("upload")
	defer file.Close()
	f, err := os.OpenFile("./uploads/"+handler.Filename, os.O_WRONLY|os.O_CREATE, 0666)
	if err!=nil{
		utils.HandleError(c, "INTERNAL_ERROR")
		return
	}
	defer f.Close()
	// save file to disk
	io.Copy(f, file)
	bank := c.Param("bank")
	excelMap, err := utils.ExcelToMap(f.Name())
	if err!=nil{
		utils.HandleError(c, "INTERNAL_ERROR")
		return
	}
	keys := utils.GetKeys()
	err = sh.service.StoreStatementFromExcelMap(excelMap, keys, bank, company )
}