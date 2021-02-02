package handlers

import (
	"database/sql"
	"github.com/gin-gonic/gin"
	"github.com/terminal-ator/xltron/api"
	"github.com/terminal-ator/xltron/models"
	"log"
	"time"
)

type UserHandler struct {
	DB *sql.DB
	userService api.UserService
}

func ConstructUserHandler( userService api.UserService, DB *sql.DB) UserHandler{
	return UserHandler{userService: userService, DB: DB}
}

func InitUserHandlers(DB *sql.DB, router *gin.RouterGroup){
	userService := api.ConstructUserService(DB)
	userHandler := ConstructUserHandler(&userService, DB)

	user := router.Group("/user")
	{
		user.POST("/signup", userHandler.PostSignUpEmail)
		user.POST("/signin", userHandler.PostSignInEmail)
	}

}


func (uh *UserHandler) PostSignUpEmail(c *gin.Context){
	var user models.User
	err := c.BindJSON(&user)
	if err!=nil{
		log.Println("Failed to read json, exiting", err.Error())
		c.JSON(403,gin.H{"message":"Invalid request", "code":"INVALID_REQ"})
		return
	}
	token, err := uh.userService.SignUpWithEmail(user.Name, user.Email, user.Password)
	if err!=nil{
		log.Println("User already exist, exiting", err.Error())
		c.JSON(403, gin.H{"message":"User already exist", "code":"USER_EXIST"})
		return
	}
	c.SetCookie("token", token, int(time.Now().Add(12000).Unix()),"", "/", false, true )
	c.JSON(200,gin.H{"message":"Sign Up successful.", "code":"SIGN_UP", "token": token })
}

func (uh *UserHandler) PostSignInEmail(c *gin.Context){
	var user models.User
	err := c.BindJSON(&user)
	if err!=nil{
		log.Println("Failed to read json, exiting", err.Error())
		c.JSON(403,gin.H{"message":"Invalid request", "code":"INVALID_REQ"})
		return
	}
	token, err := uh.userService.SignInWithEmail(user.Email, []byte(user.Password))
	if err!=nil{
		log.Println("User already exist, exiting", err.Error())
		c.JSON(403, gin.H{"message":"User already exist", "code":"USER_EXIST"})
		return
	}
	c.SetCookie("token", token, int(time.Now().Add(12000).Unix()),"", "/", false, true )
	c.JSON(200,gin.H{"message":"Sign in successful.", "code":"SIGN_IN", "token": token })
}

