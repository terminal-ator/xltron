package api

import (
	"github.com/terminal-ator/xltron/interfaces"
	"github.com/terminal-ator/xltron/models"
	"log"
)


type CompanyService interface{
	CreateCompany(name string, start string, end string, year string) (models.Company, error)
	GetStartAndEndDateForYearID(yearID int64) (string, string, error)
}

type companyService struct {
	DB interfaces.Queryable
}

func ConstructCompanyService(db interfaces.Queryable) companyService{
	return companyService{
		DB: db,
	}
}

func (cs *companyService) CreateCompany(name string, start string, end string, year string) (models.Company, error){

	companyResult := cs.DB.QueryRow(`Insert into company(name, year) values($1,$2) returning id`, name, year)
	var company models.Company
	company.Name = name
	err := companyResult.Scan(&company.ID)
	if err!=nil{
		return company, err
	}
	company.Year = year


	// create company year
	_, cmpErr := cs.DB.Exec(`Insert into company_years(startdate, enddate,yearstring, companyid) values($1,$2,$3,$4)`,
		start, end, year, company.ID)

	if cmpErr!=nil{
		return company, cmpErr
	}

	_, beatErr := cs.DB.Exec(`Insert into 
					beat(name, addn1, addn2, companyid, short_name)
					values($1,$2,$3,$4,$5)`, "Others", "Address1", "Address2", company.ID,"OTH",
		)

	if beatErr!=nil{
		return company, beatErr
	}

	return company, nil
}


func (cs *companyService) GetStartAndEndDateForYearID(yearID int64) (string, string, error){
	res := cs.DB.QueryRow("Select startdate, enddate from company_years where id =$1", yearID)
	var startDate, endDate string
	scanError := res.Scan(&startDate, &endDate)

	if scanError!=nil{
		log.Println("No year found for the id", scanError.Error())
		return "", "", scanError
	}

	return startDate, endDate, nil

}