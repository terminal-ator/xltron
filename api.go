package main

import (
	"fmt"
	"log"
	"net/http"
	"strings"

	"database/sql"

	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/models"
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
	Beat    int32  `json:"beatID"`
}

func GetAllMasters(c *gin.Context) {
	company := c.Param("company")
	masters, err := DB.Query(`Select id,cust_id, ismaster, name, area, company_id, chq_flg from masters where
	 ismaster = 1 and company_id=$1 order by name`, company)
	if err != nil {
		log.Fatal(err)
	}
	masterArray := make([]models.Master, 0)
	for masters.Next() {
		var master models.Master
		if err := masters.Scan(&master.ID, &master.CustID, &master.IsMaster, &master.Name, &master.Area, &master.CompanyID, &master.ChequeFlag); err != nil {
			log.Fatal(err)
		}
		masterArray = append(masterArray, master)

	}
	c.JSON(200, gin.H{
		"masters": masterArray,
	})
}

func GetAllAccounts(c *gin.Context) {
	company := c.Param("company")

	query := `SELECT A.ID,A.NAME,A.COMPANYID, A.CHQ_FLG, A.GROUPID, B.Balance from ACCOUNT_MASTER A INNER JOIN(
			SELECT AM.ID, COALESCE(SUM(P.AMOUNT),0) AS BALANCE FROM ACCOUNT_MASTER AM LEFT OUTER JOIN POSTING P ON AM.ID = P.MASTERID
			WHERE AM.COMPANYID = $1 GROUP BY AM.ID) B ON A.ID=B.ID ORDER BY NAME`

	rows, err := DB.Query(query, company)
	ErrorHandler(err, c)
	masters := make([]models.Master, 0)
	for rows.Next() {
		var mstr models.Master
		err := rows.Scan(&mstr.CustID, &mstr.Name, &mstr.CompanyID, &mstr.ChequeFlag, &mstr.GroupID, &mstr.Balance)
		ErrorHandler(err, c)
		masters = append(masters, mstr)
	}
	c.JSON(200, masters)
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

	_, dbError := DB.Exec("select upd_sttmnt_ldgr($2,$1,$3)", req.CustID, req.StatementID, req.CompanyID)
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
	bankArray := make([]models.Bank, 0)
	for banks.Next() {
		var bank models.Bank
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
	compArray := make([]models.Company, 0)
	for companies.Next() {
		var comp models.Company
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
	statementArray := make([]models.Statement, 0)
	for statements.Next() {
		var stat models.Statement
		if err := statements.Scan(&stat.ID,
			&stat.Narration, &stat.Date, &stat.RefNo, &stat.CreatedAt,
			&stat.CustID, &stat.Deposit, &stat.Withdrawl, &stat.Bank.ID,
			&stat.Company.ID, &stat.Company.Name, &stat.Company.Year, &stat.Bank.Name); err != nil {
			log.Fatal(err)
		}
		master := DB.QueryRow("Select id, cust_id, name from masters where cust_id=$1 and company_id = $2 and isMaster=1", stat.CustID, company)
		var nMaster models.Master
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
	groupArray := make([]models.Group, 0)
	for db.Next() {
		var grp models.Group
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
	_, dbError := DB.Exec(CREATE_NEW_MASTER, strings.ToUpper(req.Name), req.Company, req.Group)
	if dbError != nil {
		log.Fatalln(err)
	}
	c.JSON(200, gin.H{
		"message": "Successful Master creation",
	})
}

func GetCompanies(c *gin.Context) {
	companyID := c.Param("company")

	rows, err := DB.Query("Select * from company_masters where company_id = $1", companyID)

	if err != nil {
		c.String(http.StatusBadRequest, err.Error())
	}

	var companies []models.UploadCompanies
	for rows.Next() {
		var temp models.UploadCompanies
		err := rows.Scan(&temp.ID, &temp.Name, &temp.CompanyID)
		if err != nil {
			log.Fatal(err)
		}
		companies = append(companies, temp)
	}
	c.JSON(http.StatusOK, gin.H{"data": companies})
}

func FetchStatements(c *gin.Context) {
	bank_id := c.Param("bank")
	var statements *sql.Rows
	var dbError error
	if bank_id == "all" {
		statements, dbError = DB.Query(ALL_STATEMENT)
	} else {
		statements, dbError = DB.Query(BANK_WISE_STATEMENT, bank_id)
	}

	stats := make([]models.Statement, 0)
	// fmt.Println(statements)
	for statements.Next() {
		var stat models.Statement
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
		// log.Println(stat.CustID)
		master := DB.QueryRow(`Select id, id, name from account_master 
			where id=$1 and companyid=$2`, stat.CustID, stat.CompanyID)
		var nMaster models.Master
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
		var nBank models.Bank
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
}

func FetchBeat(c *gin.Context) {
	cmp := c.Param("company")
}
