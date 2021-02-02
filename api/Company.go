package api

import (
	"database/sql"
	"github.com/terminal-ator/xltron/models"
	"log"
)

type CompanyService interface {
	CreateCompany(name string, start string, end string, year string, userID int64) (models.Company, error)
	GetStartAndEndDateForYearID(yearID int64) (string, string, error)
	FetchCompanies(userID int64) ([]models.Company, error)
	SelectCompany(userID int64, companyID int64) (string, error)
}

type companyService struct {
	DB *sql.DB
}

func ConstructCompanyService(db *sql.DB) companyService {
	return companyService{
		DB: db,
	}
}

func (cs *companyService) CreateCompany(name string, start string,
	end string, year string, userID int64) (models.Company, error) {

	companyResult := cs.DB.QueryRow(`Insert into company(name, year) values($1,$2) returning id`, name, year)
	var company models.Company
	company.Name = name
	err := companyResult.Scan(&company.ID)
	if err != nil {
		return company, err
	}
	company.Year = year

	// add to usr_company
	_, joinError := cs.DB.Exec(`INSERT into users_company(user_id, company_id, type) 
					values ($1,$2,$3)`, userID, company.ID,"OWNER")

	if joinError!=nil{
		log.Println("Failed to add an entry in the users_company relation")
		return models.Company{}, joinError
	}


	// create company year
	_, cmpErr := cs.DB.Exec(`Insert into company_years(startdate, enddate,yearstring, companyid) values($1,$2,$3,$4)`,
		start, end, year, company.ID)

	var beatID int64

	if cmpErr != nil {
		return company, cmpErr
	}

	beatRow := cs.DB.QueryRow(`Insert into 
					beat(name, addn1, addn2, companyid, short_name)
					values($1,$2,$3,$4,$5) returning id`, "Others", "Address1", "Address2", company.ID, "OTH",
	)

	beatErr := beatRow.Scan(&beatID)

	if beatErr != nil {
		return company, beatErr
	}

	// create default ledgers
	defaultLedgers := []models.Master{
		{
			Name:           "Cash",
			GroupID:        6,
			OpeningBalance: 0,
			BeatID:         beatID,
			CompanyID:      company.ID,
		},
	}

	masterService := ConstructMasterService(cs.DB)

	for _, ledger := range defaultLedgers {
		masterService.CreateMaster(ledger)
	}

	return company, nil
}

func (cs *companyService) GetStartAndEndDateForYearID(yearID int64) (string, string, error) {
	res := cs.DB.QueryRow("Select startdate, enddate from company_years where id =$1", yearID)
	var startDate, endDate string
	scanError := res.Scan(&startDate, &endDate)

	if scanError != nil {
		log.Println("No year found for the id", scanError.Error())
		return "", "", scanError
	}

	return startDate, endDate, nil

}

func (cs *companyService) FetchCompanies(userID int64) ([]models.Company, error) {
	companies, err := cs.DB.Query(`select company.id, company.name, company.year
											from company
         										inner join
     											 users_company uc
     											on company.id = uc.company_id
												where uc.user_id = $1`, userID)
	if err != nil {
		return nil, err
	}
	compArray := make([]models.Company, 0)
	for companies.Next() {
		var comp models.Company
		if err := companies.Scan(&comp.ID, &comp.Name, &comp.Year); err != nil {
			log.Fatal(err)
		}
		compArray = append(compArray, comp)
	}

	return compArray, nil
}

func (cs *companyService) SelectCompany(userID int64, companyID int64) (string, error){

	// check if user owns company
	res := cs.DB.QueryRow(`Select id from users_company where user_id=$1 and company_id=$2`, userID, companyID )
	var id int64
	err := res.Scan(&id)
	if err!=nil{
		return "",err
	}

	return GenerateJWTOnCompanySelect(userID, companyID)

}
