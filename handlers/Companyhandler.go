package handlers

import (
	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/api"
	"github.com/terminal-ator/xltron/utils"
	"log"
	"net/http"
)

type CreateCompanyReq struct {
	Name string `json:"name"`
	StartDate string `json:"startdate"`
	EndDate string `json:"enddate"`
	Year string `json:"year"`
}

type CompanyHandler struct {
	service api.CompanyService
}

func ConstructCompanyHandle(service api.CompanyService) CompanyHandler{
	return CompanyHandler{
		service: service,
	}
}

func (ch *CompanyHandler) PostNewCompany(c *gin.Context){
	var company CreateCompanyReq
	err := c.BindJSON(&company)

	if err!=nil{
		log.Println("Invalid New company request, exiting")
		c.String(http.StatusBadRequest, "Wrong format, please try again")
		return
	}

	savedCompany, zerr := ch.service.CreateCompany(company.Name, company.StartDate, company.EndDate, company.Year)

	if zerr!=nil{
		utils.ErrorHandler(zerr,c)
		return
	}
	c.JSON(200, savedCompany)
}


