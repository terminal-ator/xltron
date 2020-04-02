package main

import (
	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/models"
	"strconv"
)

func GetCompanyYears(c *gin.Context) {
	company := c.MustGet("company").(string)
	cmp, _ := strconv.Atoi(company)

	c.JSON(200, models.FetchYears(DB, int32(cmp)))
}
