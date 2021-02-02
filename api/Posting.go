package api

import (
	"database/sql"
	"github.com/terminal-ator/xltron/models"
	"log"
)

type HistoryResult struct{
	MasterID int `json:"master_id"`
	OpeningBalance float64 `json:"opening_balance"`
	StartDate string `json:"start_date"`
	EndDate string `json:"end_date"`
	ClosingBalance float64 `json:"closing_balance"`
	Journals []models.Journal `json:"journals"`
	CurrentTotal float64 `json:"current_total"`
	DebitTotal float64 `json:"debit_total"`
	CreditTotal float64 `json:"credit_total"`
}

type PostingService interface {
	GetPostingHistoryForMasterDateWise( masterID int64, startDate string, endDate string) (HistoryResult, error)
	DeleteJournal(int64) error
	MakeOrUpdateJournal(journal models.AJournal)  ( models.AJournal ,error)
}

type postingService struct{
	DB *sql.DB
}

func ConstructPostingService(db *sql.DB) postingService{
	return postingService{
		DB: db,
	}
}


func (ps *postingService) GetPostingHistoryForMasterDateWise( masterID int64, startDate string, endDate string) (HistoryResult, error){

	masterService := ConstructMasterService(ps.DB)
	master, err := masterService.GetMaster(masterID)

	var result HistoryResult

	if err!=nil{
		log.Println("No master found", err.Error())
		return HistoryResult{}, err
	}

	// calculate opening
	sumOfOld := ps.DB.QueryRow(`select coalesce(sum(amount),0) from
(select * from posting inner join journal j on posting.journalid = j.id where masterid=$1 and j.date<$2) p`,
    									masterID, startDate)
	var sumScan float64 = 0.0
	scanError := sumOfOld.Scan(&sumScan)

	if scanError!=nil{
		log.Println("Failed to find older sums", scanError.Error())
	}
	// add opening balance to the sum
	sumScan += master.OpeningBalance

	result.OpeningBalance = sumScan

	// fetch postings
	QUERY := `SELECT 
					 a.id, b.date, b.id, b.narration, b.refno, b.sttmt_id,a.amount
					 FROM POSTING a
					 INNER JOIN
					 JOURNAL b on a.journalid = b.id
					 WHERE a.masterid = $1
					 AND b.date >= $2
					 AND b.date <= $3
					 order by b.date, b.refno 
                 `
	rows, err := ps.DB.Query(QUERY, masterID, startDate, endDate)
	var journals []models.Journal
	var sumOfJournals float64 = 0
	var sumOfDebits float64 = 0
	var sumOfCredits float64 = 0
	if err!=nil{
		log.Println("No postings found")
	}else{
		for rows.Next(){
			var temp models.Journal
			scnerr := rows.Scan(&temp.ID, &temp.Date, &temp.JournalID, &temp.Narration,
				&temp.RefNo, &temp.StatementID, &temp.Amount)
			if scnerr!=nil{
				log.Println("Faied to scan a journal, exiting...")
				return HistoryResult{}, nil
			}
			if temp.Amount <= 0 {
				sumOfDebits += float64(temp.Amount)
			} else{
				sumOfCredits += float64(temp.Amount)
			}
			sumOfJournals += float64(temp.Amount)
			journals = append(journals, temp)
		}
	}
	result.Journals = journals
	result.StartDate = startDate
	result.EndDate = endDate
	result.CurrentTotal = sumOfJournals
	result.DebitTotal = sumOfDebits
	result.CreditTotal = sumOfCredits

	// calculate closing
	closingBalance := sumScan + sumOfJournals
	result.ClosingBalance = closingBalance

	return result, nil

}

func (ps *postingService) DeleteJournal( journalID int64) error{

	tx, _ := ps.DB.Begin()
	// delete postings
	jrnl, err := models.FetchJournal(tx, int32(journalID))
	if err!=nil{
		log.Println("Failed to delete postings, rolling back")
		tx.Rollback()
		return err
	}
	// delete journal
	err = jrnl.DeleteJournal(ps.DB)
	if err!=nil{
		log.Println("Failed to delete journal, rolling back")
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}

func (ps *postingService) MakeOrUpdateJournal(journal models.AJournal)  ( models.AJournal ,error){

	tx, _ := ps.DB.Begin()
	if journal.ID == 0 {
		err := journal.MakeJournal(tx)
		if err!=nil{
			log.Println("Failed to add a journal.", err.Error())
			tx.Rollback()
			return models.AJournal{},err
		}
	}else{
		err := journal.UpdateJournalNew(tx)
		if err!=nil{
			log.Println("Failed to update the journal", err.Error())
			tx.Rollback()
			return models.AJournal{},err
		}
	}
	tx.Commit()
	return journal, nil
}

