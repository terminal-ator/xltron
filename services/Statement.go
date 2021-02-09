package services

import (
	"database/sql"
	"github.com/google/uuid"
	"github.com/kierdavis/dateparser"
	"github.com/terminal-ator/xltron/models"
	"log"
	"strconv"
	"time"
)

type StatementService interface {
	FetchStatementsForBankDateWise(companyID int64, bankID int64, startDate string, endDate string) ([]models.Statement, error)
	MoveFromStatementToVoucher(statementID int32, masterID int32, companyID int32, bankID int32) error
	StoreStatementFromExcelMap(excelMap models.MapType, keys models.KeyType, bankID string, companyID int64) error
}

type statementService struct {
	DB        *sql.DB
	TableName string
}

func ConstructStatementService(db *sql.DB, tableName string) statementService {
	return statementService{
		DB:        db,
		TableName: tableName,
	}
}

func (ss *statementService) FetchStatementsForBankDateWise(companyID int64, bankID int64, startDate string, endDate string) ([]models.Statement, error) {
	if startDate != "" {
		if endDate == "" {
			endDate = startDate
		}
	} else {
		endDate = time.Now().Format("2006-01-02")
		startDate = time.Date(time.Now().Year(), time.Now().Month(), 1, 0, 0, 0, 0, time.Now().Location()).Format("2006-01-02")
	}
	stats := make([]models.Statement, 0)
	statements, dbError := ss.DB.Query(`
												Select statement.id,
													   narration,
													   date,
													   refno,
													   created_at,
													   statement.cust_id,
													   deposit,
													   withdrawl,
													   bank_id,
													   company_id,
													   am.id,
													   am.id,
													   am.name
												from statement
														 left outer join account_master am on statement.cust_id = am.id
												where bank_id = $1 and company_id = $4
												  and date >= $2
												  and date <= $3
												order by date, withdrawl, deposit
	`, bankID, startDate, endDate, companyID)

	if dbError != nil {
		return nil, dbError
	}

	for statements.Next() {
		var stat models.Statement
		var idReader sql.NullInt64
		var custIDRead sql.NullInt64
		var nameReader sql.NullString

		if err := statements.Scan(&stat.ID,
			&stat.Narration,
			&stat.Date,
			&stat.RefNo,
			&stat.CreatedAt,
			&stat.CustID,
			&stat.Deposit,
			&stat.Withdrawl,
			&stat.BankID,
			&stat.CompanyID,
			&idReader,
			&custIDRead,
			&nameReader); err != nil {
			return nil, err
		}
		stat.Master.ID = int32(idReader.Int64)
		stat.Master.CustID = custIDRead
		stat.Master.Name = nameReader.String
		stats = append(stats, stat)
	}

	return stats, nil

}

// TODO - Improve this code
func (ss *statementService) MoveFromStatementToVoucher(statementID int32, masterID int32, companyID int32, bankID int32) error {
	tx, _ := ss.DB.Begin()
	var statement models.Statement
	err := statement.SqlSelectByID(ss.DB, int64(statementID))
	if err != nil {
		log.Println("Unable to find statement")
		return err
	}
	err = statement.Update(tx, int32(masterID))
	if err != nil {
		log.Println("Error while updating")

		tx.Rollback()
		return err
	}
	jid := ss.DB.QueryRow("Select id from journal where sttmt_id = $1", statementID)
	// journal id is present or not
	var journalID int32
	err = jid.Scan(&journalID)
	if err != nil {
		log.Println(err.Error())
		// create new journal
		var journal models.AJournal
		voucherType := "Receipt"
		if statement.Withdrawl.Valid {
			voucherType = "Payment"
		}
		journal.Date = statement.Date
		journal.Narration = statement.Narration
		journal.Refno = statement.RefNo
		journal.Type = voucherType
		journal.CompanyID = int32(companyID)
		journal.StatementID = statement.ID
		err := journal.Save(tx)
		if err != nil {
			log.Println("Unble to create journal exiting")
			tx.Rollback()
			return err
		}
		// create double entry posts
		if statement.Withdrawl.Valid {
			// create withdrawl post
			bankPost := &models.Posting{JournalID: journal.ID,
				MasterID: int32(bankID), AssetType: "Rs.", Amount: statement.Withdrawl.Float64, CompanyID: companyID}
			if bankPost.Save(tx) != nil {
				tx.Rollback()
				return err
			}

			custPost := &models.Posting{JournalID: journal.ID,
				MasterID: masterID, AssetType: "Rs.", Amount: -statement.Withdrawl.Float64, CompanyID: companyID}
			if custPost.Save(tx) != nil {
				tx.Rollback()
				return err
			}

		} else {
			bankPost := &models.Posting{JournalID: journal.ID,
				MasterID: bankID, AssetType: "Rs.", Amount: -statement.Deposit.Float64, CompanyID: companyID}
			if bankPost.Save(tx) != nil {
				tx.Rollback()
				return err
			}
			custPost := &models.Posting{JournalID: journal.ID,
				MasterID: masterID, AssetType: "Rs.", Amount: statement.Deposit.Float64, CompanyID: companyID}
			if custPost.Save(tx) != nil {
				tx.Rollback()
				return err
			}
		}
	} else {
		// update the master id for posting
		// get posting id where journal id is this and customer is there
		pid := ss.DB.QueryRow(`Select a.id from posting a inner join account_master b on a.masterid=b.id
		 where a.journalid =$1 and b.groupid!=5`, journalID)
		var postingId int32
		err := pid.Scan(&postingId)
		if err != nil {
			log.Println("No Posting found, going to create some")
			if statement.Withdrawl.Valid {
				// create withdrawl post
				bankPost := &models.Posting{JournalID: journalID,
					MasterID: bankID, AssetType: "Rs.", Amount: statement.Withdrawl.Float64, CompanyID: companyID}
				if bankPost.Save(tx) != nil {
					tx.Rollback()
					return err
				}

				custPost := &models.Posting{JournalID: journalID,
					MasterID: masterID, AssetType: "Rs.", Amount: -statement.Withdrawl.Float64, CompanyID: companyID}
				if custPost.Save(tx) != nil {
					tx.Rollback()
					return err
				}

			} else {
				bankPost := &models.Posting{JournalID: journalID,
					MasterID: bankID, AssetType: "Rs.", Amount: -statement.Deposit.Float64, CompanyID: companyID}
				if err := bankPost.Save(tx); err != nil {
					tx.Rollback()
					log.Println("Error on saving posting:", err.Error())
					return err
				}

				custPost := &models.Posting{JournalID: journalID,
					MasterID: masterID, AssetType: "Rs.", Amount: statement.Deposit.Float64, CompanyID: companyID}
				if err := custPost.Save(tx); err != nil {
					tx.Rollback()
					log.Println("Error in saving secong posting:", err.Error())
					return err
				}
			}
		}

		// ErrorHandler(err, c)

		_, err = ss.DB.Exec(`UPDATE POSTING set masterid = $1 where id = $2`, masterID, postingId)
		if err != nil {
			log.Println("Error while updating post")
			tx.Rollback()
			return err
		}
		// ErrorHandler(err, c)
	}
	tx.Commit()
	// update pending cheques
	log.Printf("\n Updating cheques for amount %f for account %d ", statement.Deposit.Float64, masterID)
	_, chqError := ss.DB.Exec(`UPDATE cheques set passed = true where masterid=$1 and amount = $2`, masterID, int64(statement.Deposit.Float64))
	if chqError != nil {
		log.Println(chqError.Error())
		log.Println("No pending cheque for this entry, please check.")
	}
	// create a journal id
	return nil
}

type MapType map[string][]string
type KeyType struct {
	Date      string
	Narration string
	RefNo     string
	Deposit   string
	WithDrawl string
}

func (ss *statementService) StoreStatementFromExcelMap(excelMap models.MapType, keys models.KeyType,
	bankID string, companyID int64) error {
	dates := excelMap[keys.Date]
	narrations := excelMap[keys.Narration]
	refNos := excelMap[keys.RefNo]
	deposits := excelMap[keys.Deposit]
	withdrawls := excelMap[keys.WithDrawl]
	importID := uuid.New()
	tx, _ := ss.DB.Begin()
	for i := range dates {
		withdrawl, _ := strconv.ParseFloat(withdrawls[i], 64)
		deposit, _ := strconv.ParseFloat(deposits[i], 64)
		parser := dateparser.Parser{DayFirst:true, Fuzzy:true}
		t, derr := parser.Parse(dates[i])
		if derr!=nil{
			log.Println("Failed to parse the date", derr.Error())
			tx.Rollback()
			return derr
		}
		date := t.Format("2006-01-02")
		if withdrawl != 0 {
			_, err := tx.Exec(`INSERT INTO 
    						statement(date, narration,  refno, withdrawl, bank_id, company_id, import_id)
    						values($1,$2,$3,$4,$5,$6,$7)`,
				date, narrations[i], refNos[i], withdrawl, bankID, companyID, importID.String())
			if err != nil {
				log.Println("Failed during insert in statement at index: ", i)
				log.Printf("\n Got the following error: %s", err.Error())
				tx.Rollback()
				return err
			}
		} else {
			_, err := tx.Exec(`INSERT INTO 
    						statement(date, narration,  refno, deposit, bank_id, company_id, import_id)
    						values($1,$2,$3,$4,$5,$6,$7)`,
				date, narrations[i], refNos[i], deposit, bankID, companyID, importID.String())
			if err != nil {
				log.Println("Failed during insert in statement at index: ", i)
				log.Printf("\n Got the following error: %s", err.Error())
				tx.Rollback()
				return err
			}
		}
	}
	tx.Commit()
	return nil

}
