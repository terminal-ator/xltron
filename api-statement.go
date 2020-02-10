package main

import (
	"log"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/models"
)

func GetStatementById(c *gin.Context) {
	id := c.Param("id")
	iid, err := strconv.Atoi(id)
	ErrorHandler(err, c)
	// row := DB.QueryRow(ID_WISE_STATEMENT, id)
	var statment models.Statement
	err = statment.SqlSelectByID(DB, c, int32(iid))
	ErrorHandler(err, c)
	c.JSON(200, statment)
}

type SaveStatementRequest struct {
	StatementID int32 `json:"stat_id"`
	BankID      int32 `json:"bank_id"`
	CustID      int32 `json:"cust_id"`
	CompanyID   int32 `json:"company_id"`
}

func saveStatementToCustID(c *gin.Context) {

	// bind json to parse the request
	var req SaveStatementRequest
	err := c.BindJSON(&req)
	ErrorHandler(err, c)

	tx, err := DB.Begin()

	// fetch the details of the statement
	log.Println("Fetching statement")
	var statement models.Statement
	err = statement.SqlSelectByID(DB, c, req.StatementID)
	if err != nil {
		log.Println("Unable to create statement")
		c.String(500, "Failed")
		return
	}
	// ErrorHandler(err, c, "while reading select")

	log.Println("The Id of the statement:", statement.ID)

	// update the statement
	log.Println("Updating statement")
	err = statement.Update(tx, req.CustID)
	log.Println("##############")
	if err != nil {
		log.Println("Error while updating")
		c.String(500, err.Error())
		tx.Rollback()
		return
	}
	log.Println("***********")

	// create a journal entry if there exists no journal
	jid := DB.QueryRow("Select id from journal where sttmt_id = $1", req.StatementID)

	// journal id is present or not
	var journalID int32
	err = jid.Scan(&journalID)

	if err != nil {

		log.Println(err.Error())
		// create new journal
		var journal models.AJournal

		journal.Date = statement.Date
		journal.Narration = statement.Narration
		journal.Refno = statement.RefNo
		journal.Type = "TEST"
		journal.CompanyID = req.CompanyID
		journal.StatementID = statement.ID

		err := journal.Save(tx)
		if err != nil {
			log.Println("Unble to create journal exiting")
			c.String(500, "failed")
			tx.Rollback()
			return
		}

		// create double entry posts
		if statement.Withdrawl.Valid {

			// create withdrawl post
			bankPost := &models.Posting{JournalID: journal.ID,
				MasterID: req.BankID, AssetType: "Rs.", Amount: -statement.Withdrawl.Float64, CompanyID: req.CompanyID}
			if bankPost.Save(tx) != nil {
				tx.Rollback()
				return
			}

			custPost := &models.Posting{JournalID: journal.ID,
				MasterID: req.CustID, AssetType: "Rs.", Amount: statement.Withdrawl.Float64, CompanyID: req.CompanyID}
			if custPost.Save(tx) != nil {
				tx.Rollback()
				return
			}

		} else {
			bankPost := &models.Posting{JournalID: journal.ID,
				MasterID: req.BankID, AssetType: "Rs.", Amount: statement.Deposit.Float64, CompanyID: req.CompanyID}
			if bankPost.Save(tx) != nil {
				tx.Rollback()
				return
			}

			custPost := &models.Posting{JournalID: journal.ID,
				MasterID: req.CustID, AssetType: "Rs.", Amount: -statement.Deposit.Float64, CompanyID: req.CompanyID}
			if custPost.Save(tx) != nil {
				tx.Rollback()
				return
			}
		}
	} else {

		// update the master id for posting

		// get posting id where journal id is this and customer is there
		pid := DB.QueryRow(`Select a.id from posting a inner join account_master b on a.masterid=b.id
		 where a.journalid =$1 and b.groupid!=5`, journalID)

		var postingId int32

		err := pid.Scan(&postingId)

		if err != nil {
			log.Println("No Posting found, going to create some")
			if statement.Withdrawl.Valid {

				// create withdrawl post
				bankPost := &models.Posting{JournalID: journalID,
					MasterID: req.BankID, AssetType: "Rs.", Amount: -statement.Withdrawl.Float64, CompanyID: req.CompanyID}
				if bankPost.Save(tx) != nil {
					tx.Rollback()
					return
				}

				custPost := &models.Posting{JournalID: journalID,
					MasterID: req.CustID, AssetType: "Rs.", Amount: statement.Withdrawl.Float64, CompanyID: req.CompanyID}
				if custPost.Save(tx) != nil {
					tx.Rollback()
					return
				}

			} else {
				bankPost := &models.Posting{JournalID: journalID,
					MasterID: req.BankID, AssetType: "Rs.", Amount: statement.Deposit.Float64, CompanyID: req.CompanyID}
				if err := bankPost.Save(tx); err != nil {
					tx.Rollback()
					log.Println("Error on saving posting:", err.Error())
					return
				}

				custPost := &models.Posting{JournalID: journalID,
					MasterID: req.CustID, AssetType: "Rs.", Amount: -statement.Deposit.Float64, CompanyID: req.CompanyID}
				if err := custPost.Save(tx); err != nil {
					tx.Rollback()
					log.Println("Error in saving secong posting:", err.Error())
					return
				}
			}
		}

		// ErrorHandler(err, c)

		_, err = DB.Exec(`UPDATE POSTING set masterid = $1 where id = $2`, req.CustID, postingId)
		if err != nil {
			log.Println("Error while updating post")
			tx.Rollback()
			c.String(500, "failed")
		}
		// ErrorHandler(err, c)
	}
	tx.Commit()

	// create a journal id
	c.JSON(200, "Success")
}

func updateCUSTID(c *gin.Context) {

	// rows, err := DB.Query(`Select id, cust_id, company_id from statement where cust_id is not null`)

	// if err != nil {
	// 	log.Panic(err.Error())
	// }

	// for rows.Next() {
	// 	var i, c, cm int32
	// 	err := rows.Scan(&i, &c, &cm)
	// 	if err != nil {
	// 		log.Panic(err.Error())
	// 	}

	// 	row := DB.QueryRow(`select id from account_master where cust_id=$1 and companyid=$2`, c, cm)
	// 	var cust_id int32
	// 	err = row.Scan(&cust_id)
	// 	if err != nil {
	// 		log.Panic(err.Error())
	// 	}

	// 	_, err = DB.Exec(`update statement set cust_id = $1 where id =$2 `, cust_id, i)

	// 	if err != nil {
	// 		log.Panic(err.Error())
	// 	}
	// }

	c.String(200, "This api has been removed")
}
