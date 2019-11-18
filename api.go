package main

import (
	"fmt"
	"log"

	"database/sql"

	"github.com/gin-gonic/gin"
)

type MasterRequest struct {
	StatementID int64 `json:"statement_id"`
	CustID      int64 `json:"cust_id"`
	CompanyID   int64 `json:"company_id"`
}

type CreateMasterRequest struct {
	Name    string `json:"name"`
	Group   int64  `json:"group"`
	Company int64  `json:"company"`
}

func GetAllMasters(c *gin.Context) {
	company := c.Param("company")
	masters, err := DB.Query(`Select id,cust_id, ismaster, name, area, company_id, chq_flg from masters where
	 ismaster = 1 and company_id=$1 order by name`, company)
	if err != nil {
		log.Fatal(err)
	}
	masterArray := make([]Master, 0)
	for masters.Next() {
		var master Master
		if err := masters.Scan(&master.ID, &master.CustID, &master.IsMaster, &master.Name, &master.Area, &master.CompanyID, &master.ChequeFlag); err != nil {
			log.Fatal(err)
		}
		masterArray = append(masterArray, master)

	}
	c.JSON(200, gin.H{
		"masters": masterArray,
	})
}

func PostMasterToStatement(c *gin.Context) {
	var req MasterRequest
	err := c.BindJSON(&req)
	if err != nil {
		c.JSON(502, gin.H{
			"message": "Bad request",
		})
		log.Fatal(err)
	}

	// fmt.Println("Next line shows the packet")
	// fmt.Println(req)

	_, dbError := DB.Exec("UPDATE STATEMENT SET CUST_ID=$1 where ID=$2 and company_id=$3", req.CustID, req.StatementID, req.CompanyID)
	if dbError != nil {
		log.Fatal(dbError)
	}

	// set the cust_id as cheque receivable
	DB.Exec("UPDATE MASTERS SET CHQ_FLG=1 where CUST_ID=$1 and COMPANY_ID=$2", req.CustID, req.CompanyID)

	c.JSON(200, gin.H{
		"message": "Updated statement",
	})
}

func GetAllBanks(c *gin.Context) {
	bank := c.Param("company")
	banks, err := DB.Query("Select id, name from banks where company_id=$1", bank)
	if err != nil {
		log.Fatal(err)
	}
	bankArray := make([]Bank, 0)
	for banks.Next() {
		var bank Bank
		if err := banks.Scan(&bank.ID, &bank.Name); err != nil {
			log.Fatal(err)
		}
		bankArray = append(bankArray, bank)
	}

	c.JSON(200, gin.H{
		"banks": bankArray,
	})
}

func GetAllCompanies(c *gin.Context) {
	companies, err := DB.Query("Select * from company")
	if err != nil {
		log.Fatal(err)
	}
	compArray := make([]Company, 0)
	for companies.Next() {
		var comp Company
		if err := companies.Scan(&comp.ID, &comp.Name, &comp.Year); err != nil {
			log.Fatal(err)
		}
		compArray = append(compArray, comp)
	}
	c.JSON(200, gin.H{
		"companies": compArray,
	})
}

func GetConsolidatedStatements(c *gin.Context) {
	company := c.Param("company")
	statements, dbError := DB.Query(ALL_STATEMENT_WITH_COMPANY_AND_BANK, company)
	if dbError != nil {
		if dbError != sql.ErrNoRows {
			log.Fatal(dbError)
		}
	}
	statementArray := make([]Statement, 0)
	for statements.Next() {
		var stat Statement
		if err := statements.Scan(&stat.ID,
			&stat.Narration, &stat.Date, &stat.RefNo, &stat.CreatedAt,
			&stat.CustID, &stat.Deposit, &stat.Withdrawl, &stat.Bank.ID,
			&stat.Company.ID, &stat.Company.Name, &stat.Company.Year, &stat.Bank.Name); err != nil {
			log.Fatal(err)
		}
		master := DB.QueryRow("Select id, cust_id, name from masters where cust_id=$1 and company_id = $2 and isMaster=1", stat.CustID, company)
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
		statementArray = append(statementArray, stat)
	}
	c.JSON(200, gin.H{
		"statements": statementArray,
	})
}

func GetAllGroups(c *gin.Context) {
	db, _ := DB.Query(`SELECT id, name FROM MASTER_GROUPS`)
	groupArray := make([]Group, 0)
	for db.Next() {
		var grp Group
		db.Scan(&grp.ID, &grp.Name)
		fmt.Println("Printing group name in next line")
		fmt.Println(grp.Name)
		fmt.Println(grp)
		groupArray = append(groupArray, grp)
	}
	c.JSON(200, gin.H{
		"groups": groupArray,
	})
}
func CreateMaster(c *gin.Context) {
	var req CreateMasterRequest
	err := c.BindJSON(&req)
	if err != nil {
		log.Fatalln(err)
	}
	_, dbError := DB.Exec(CREATE_NEW_MASTER, req.Name, req.Company, req.Group)
	if dbError != nil {
		log.Fatalln(err)
	}
	c.JSON(200, gin.H{
		"message": "Successful Master creation",
	})
}
