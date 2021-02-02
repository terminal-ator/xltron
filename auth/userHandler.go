package auth

import (
	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/utils"
	"log"
)


func InvalidateUser(c *gin.Context){
	c.JSON(401, utils.GeneralResponse{
		Code:    utils.RE_AUTH,
		Message: "Invalid token",
		Data:    nil,
	})
}


func TokenUser() gin.HandlerFunc{
	return func(c *gin.Context){
		authHeader := c.GetHeader("Authorization")
		if authHeader==""{
			log.Println("No Header found, returning")
			utils.HandleError(c,utils.INVALID_TOKEN)
			return
		}
		token := authHeader[7:]

		parsedToken, err := jwt.Parse(token, func(tkn *jwt.Token) (interface{}, error) {
			return []byte(utils.JWTSECRET),nil
		})

		if err!=nil{
			c.Next()
			return
		}

		if claims, ok := parsedToken.Claims.(jwt.MapClaims); ok && parsedToken.Valid{
			userID := claims["user_id"]
			c.Set("user_id", userID)
			c.Next()
		}else{
			c.Next()
			return
		}
	}
}

func CompanyTokenUser() gin.HandlerFunc{
	return func(c *gin.Context) {
		authHeader := c.GetHeader("Authorization")
		if authHeader==""{
			log.Println("No Header found, returning")
			utils.HandleError(c,utils.INVALID_TOKEN)
			c.Abort()
			return
		}
		token := authHeader[7:]

		parsedToken, err := jwt.Parse(token, func(tkn *jwt.Token) (interface{}, error) {
			return []byte(utils.JWTSECRET),nil
		})

		if err!=nil{
			utils.HandleError(c, utils.INVALID_TOKEN)
			c.Abort()
			return
		}

		if claims, ok := parsedToken.Claims.(jwt.MapClaims); ok && parsedToken.Valid{
			userID := claims["user_id"]
			companyID := claims["company"]
			c.Set("user_id", userID)
			c.Set("company", companyID)
			c.Next()
		}else{
			utils.HandleError(c,utils.INVALID_TOKEN)
			c.Abort()
			return
		}

	}
}