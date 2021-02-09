package handlers

import (
	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/services"
	"log"
	"net/http"
	"strconv"
	)

type ReceiptRequest struct{
	Date string                     `json:"date"`
	ReceiptID int                   `json:"receipt_id"`
	Entries []services.ReceiptEntry `json:"receipt_entry"`
}

type ReceiptHandler struct {
	service services.ReceiptService
}

func ConstructReceiptHandler(service services.ReceiptService) ReceiptHandler{
	return ReceiptHandler{service: service}
}


func (rh *ReceiptHandler) PostReceipt(c *gin.Context){
	company := c.MustGet("company").(string)
	companyID, _ := strconv.Atoi(company)
	var receipt ReceiptRequest
	err := c.BindJSON(&receipt)

	if err!=nil{
		c.String(http.StatusBadRequest, err.Error())
		return
	}

	zerr := rh.service.CreateReceipt(receipt.Date, companyID ,receipt.ReceiptID,
		receipt.Entries)

	if zerr != nil{
		log.Println("Failed to save receipt", zerr.Error())
		c.String(500,"There was an error")
		return
	}

	c.String(http.StatusOK,"Receipt Saved")

}