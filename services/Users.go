package services

import (
	"database/sql"
	"github.com/dgrijalva/jwt-go"
	"github.com/terminal-ator/xltron/models"
	"github.com/terminal-ator/xltron/utils"
	"time"
)
import "golang.org/x/crypto/bcrypt"

type UserService interface {
	SignInWithEmail(email string, password []byte) (string, error)
	SignUpWithEmail(name string, email string, password string)(string, error)
	SelectCompany(userID int64, companyID int64) (string, error)
}

type userService struct {
	DB *sql.DB
}

func ConstructUserService(db *sql.DB) userService{
	return userService{
		DB: db,
	}
}


func GenerateJWTOnSignin(userID int64)(string, error){
	token := jwt.NewWithClaims(jwt.SigningMethodHS256,jwt.MapClaims{
		"user_id" :userID,
		"created" : time.Now().Unix(),
		"validity": time.Now().Add(60*60*1000).Unix(),
		"company": 0,
	})
	tokenString, err := token.SignedString([]byte(utils.JWTSECRET))
	return tokenString, err
}

func GenerateJWTOnCompanySelect(userID int64, companyID int64) (string, error){
	token := jwt.NewWithClaims(jwt.SigningMethodHS256,jwt.MapClaims{
		"user_id" :userID,
		"company" : companyID,
		"created" : time.Now().Unix(),
		"validity": time.Now().Add(60*60*1000).Unix(),
	})
	tokenString, err := token.SignedString([]byte(utils.JWTSECRET))
	return tokenString, err
}

func (us *userService) SignInWithEmail(email string, password []byte) (string, error){
	res := us.DB.QueryRow(`SELECT password from users where email=$1`, email)
	var hash string

	if err := res.Scan(&hash); err!=nil{
		return "", err
	}

	if err := bcrypt.CompareHashAndPassword([]byte(hash), password); err != nil{
		return "", err
	}

	user := models.ConstructUser(us.DB)

	if err := user.LoadForEmail(email); err != nil{
		return "", err
	}

	// generate jwt token
	return GenerateJWTOnSignin(user.ID)

}

func (u *userService) SignUpWithEmail(name string, email string, password string) (string,error){
	hash, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)

	if err!=nil{
		return "",err
	}

	res := u.DB.QueryRow(`INSERT INTO
    users(name, email, password) VALUES( $1, $2,$3) RETURNING id`,name,  email, hash)

	var userID int64
	dbErr := res.Scan(&userID)

	if dbErr!=nil{
		return "",dbErr
	}

	return GenerateJWTOnSignin(userID)

}

func (u *userService) SelectCompany(userID int64, companyID int64) (string, error){

	// check if user owns company
	res := u.DB.QueryRow(`Select id from users_company where user_id=$1 and company_id=$2`, userID, companyID )
	var id int64
	err := res.Scan(&id)
	if err!=nil{
		return "",err
	}

	return GenerateJWTOnCompanySelect(userID, companyID)

}