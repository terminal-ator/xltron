package utils

import (
	"github.com/gin-gonic/gin"
	"log"
)

const(
	INVALID_REQUEST = "INVALID_REQUEST"
	INVALID_TOKEN = "INVALID_TOKEN"
)

func ErrorHandler(err error, c *gin.Context) {
	if err != nil {
		log.Printf("\n Error occured: %s", err.Error())
		c.String(500, err.Error())
	}
}

func HandleError(c *gin.Context, errorType string){
	switch errorType {
	case INVALID_REQUEST:
		c.JSON(400, GeneralResponse{
			Code:    INVALID_REQUEST,
			Message: "The input provided has a wrong format",
			Data:    nil,
		})
		return
	case INVALID_TOKEN:
		c.JSON(401,GeneralResponse{
			Code:    INVALID_TOKEN,
			Message: "Invalid user token, retry by loggin in",
			Data:    nil,
		})
		return
	default:
		c.JSON(500, GeneralResponse{
			Code:    "SERVER_ERROR",
			Message: "There was an issue with your request",
			Data:    nil,
		})
	}
}
