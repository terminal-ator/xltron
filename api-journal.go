package main

import (
	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/models"
)

func MakeJournal(c *gin.Context) {

	var Journal models.AJournal
	c.BindJSON(&Journal)

	tx, _ := DB.Begin()
	if Journal.ID == 0 {
		Journal.MakeJournal(tx)
	} else {
		err := Journal.UpdateJournal(tx)
		if err != nil {
			ErrorHandler(err, c, "Failed while updating journal")
			return
		}
	}
	tx.Commit()
	c.JSON(200, Journal)

}
