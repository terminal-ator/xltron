package utils

import (
	"log"

	"github.com/gin-gonic/gin"
)

func ErrorHandler(err error, c *gin.Context) {
	if err != nil {
		log.Printf("\n Error occured: %s", err.Error())
		c.String(500, err.Error())
	}
}
