package models

import (
	"crypto/rand"
	"database/sql"
	"fmt"
)

type User struct{
	ID int64 `json:"id"`
	Name string `json:"name"`
	Email string `json:"email"`
	Password string `json:"password, omitempty"`
	DB *sql.DB `json:"-"`
}

func ConstructUser(db *sql.DB) User {
	return User{
		DB: db,
	}
}

func GenerateToken() (string, error) {
	buf := make([]byte, 16)
	_, err := rand.Read(buf)

	if err != nil {
		return "", err
	}

	return fmt.Sprintf("%x", buf), nil
}

func (u *User) LoadForEmail(email string) error{

	q := u.DB.QueryRow("Select id, name from users where email=$1", email)

	err := q.Scan(&u.ID, &u.Email)

	if err!=nil{
		return err
	}
	return nil
}

func LoadFromID( DB *sql.DB ,userID int64) (User, error){

	var u User
	q := DB.QueryRow("Select id, email, name from users where id=$1", userID)
	err := q.Scan(&u.ID, &u.Email, &u.Name)
	return u,err
}

func (u *User) RegisterSession()(string,error){
	token, _ := GenerateToken()
	_, err := u.DB.Exec(`INSERT into sessions(sessionid, user_id) values ($1,$2)`, token, u.ID)
	if err!=nil{
		return "", nil
	}

	return token, nil
}

func (u *User) LoadUserFromSession(sessionID string) error{
	q := u.DB.QueryRow(`Select user_id from sessions where sessionid = $1`, sessionID)
	err := q.Scan(u.ID)

	if err!=nil{
		return err
	}
	return nil

}


func (u *User) OwnsCompany(companyID int64) error{
	q := u.DB.QueryRow(`SELECT id from users_company where user_id=$1 and company_id=$2`, u.ID, companyID)
	var fakeID int64
	err := q.Scan(&fakeID)

	return err

}
