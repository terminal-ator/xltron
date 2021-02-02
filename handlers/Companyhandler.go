package handlers

import (
	"database/sql"
	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/api"
	"github.com/terminal-ator/xltron/auth"
	"github.com/terminal-ator/xltron/utils"
	"log"
	"net/http"
	"strconv"
)

type CreateCompanyReq struct {
	Name      string `json:"name"`
	StartDate string `json:"startdate"`
	EndDate   string `json:"enddate"`
	Year      string `json:"year"`
}

type CompanyHandler struct {
	service api.CompanyService
}

func InitCompany(DB *sql.DB, router *gin.RouterGroup) {

	companyService := api.ConstructCompanyService(DB)
	companyHandler := ConstructCompanyHandle(&companyService)

	company := router.Group("/company")
	company.Use(auth.TokenUser())
	{
		company.GET("/all", companyHandler.GetCompanies)
		company.POST("/", companyHandler.PostNewCompany)
		company.POST("/select/:company", companyHandler.PostSelectCompany)

	}

}

func ConstructCompanyHandle(service api.CompanyService) CompanyHandler {
	return CompanyHandler{
		service: service,
	}
}

func (ch *CompanyHandler) PostNewCompany(c *gin.Context) {
	var company CreateCompanyReq
	err := c.BindJSON(&company)

	user, has := c.Get("user_id")
	if !has {
		c.JSON(400, gin.H{"message": "You need to Login", "code": utils.RE_AUTH})
		return
	}
	userID := user.(float64)

	if err != nil {
		log.Println("Invalid New company request, exiting")
		c.String(http.StatusBadRequest, "Wrong format, please try again")
		return
	}

	savedCompany, zerr := ch.service.CreateCompany(company.Name, company.StartDate,
		company.EndDate, company.Year, int64(userID))

	if zerr != nil {
		utils.ErrorHandler(zerr, c)
		return
	}
	c.JSON(200, savedCompany)
}

func (ch *CompanyHandler) GetCompanies(c *gin.Context) {
	user, has := c.Get("user_id")
	if !has {
		c.JSON(400, gin.H{"message": "You need to Login", "code": utils.RE_AUTH})
		return
	}
	userID := user.(float64)

	companies, err := ch.service.FetchCompanies(int64(userID))

	if err != nil {
		c.JSON(500, gin.H{"message": "No companies found", "code": utils.RE_AUTH})
		return
	}

	c.JSON(200, gin.H{
		"companies": companies,
	})
}

func (uh *CompanyHandler) PostSelectCompany(c *gin.Context) {
	user, has := c.Get("user_id")
	if !has {
		c.JSON(401, gin.H{"message": "Login required", "code": utils.RE_AUTH})
		return
	}
	log.Printf("\n The user we got is: %v", user)
	userID := user.(float64)

	company := c.Param("company")
	cmp, convError := strconv.Atoi(company)
	if convError != nil {
		c.JSON(403, gin.H{"message": "Invalid company id", "code": utils.INVALID_COMPANY})
		return
	}

	token, err := uh.service.SelectCompany(int64(userID), int64(cmp))
	if err != nil {
		c.JSON(500, utils.GeneralResponse{
			Code:    "INTERNAL_ERR",
			Message: "Error while processing your request",
			Data:    nil,
		})
	}

	c.JSON(200, utils.GeneralResponse{
		Code:    "COMPANY_SELECTED",
		Message: "Company Selected Successfully",
		Data:    token,
	})

}
