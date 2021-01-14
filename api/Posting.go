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
}

type PostingService interface {
	GetPostingHistoryForMasterDateWise( masterID int64, startDate string, endDate string) (HistoryResult, error)
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
			sumOfJournals += float64(temp.Amount)
			journals = append(journals, temp)
		}
	}
	result.Journals = journals
	result.StartDate = startDate
	result.EndDate = endDate
	result.CurrentTotal = sumOfJournals

	// calculate closing
	closingBalance := sumScan + sumOfJournals
	result.ClosingBalance = closingBalance

	return result, nil

}

