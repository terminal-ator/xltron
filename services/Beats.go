package services

import (
	"github.com/terminal-ator/xltron/interfaces"
	"github.com/terminal-ator/xltron/models"
	"log"
)

type BeatService interface {
	FetchBeatsAndGroups(companyID int) ([]models.Beat, []models.Group, error )
	CreateBeats(companyID int, name string ) ( []models.Beat, []models.Group, error)
}

type beatService struct {
	DB interfaces.Queryable
	TableName string
}

func ConstructBeatService(db interfaces.Queryable) beatService{
	return beatService{
		DB: db,
		TableName: "beat",
	}
}



func (bs *beatService) FetchBeatsAndGroups(companyID int) ([]models.Beat, []models.Group, error ) {

	beats, err := bs.DB.Query(`SELECT id, name, addn1, addn2, companyid, short_name from beat where companyid=$1`, companyID)

	var resBeats []models.Beat

	if err!=nil{
		log.Println("Failed to find beat for the companyid")
		return nil, nil, err
	}

	for beats.Next(){
		var t models.Beat
		readErr := beats.Scan(&t.ID, &t.Name, &t.Addn1, &t.Addn2, &t.CompanyID, &t.ShortName)

		if readErr!=nil{
			log.Println("Failed scan the values", readErr.Error())
			return nil, nil, readErr
		}

		resBeats = append(resBeats, t)
	}

	groups, err := bs.DB.Query(`SELECT *  from master_groups`)

	if err!=nil{
		log.Println("Failed to find groups")
		return nil, nil, err
	}

	var resGroups []models.Group
	for groups.Next(){
		var t models.Group
		rErr := groups.Scan(&t.ID, &t.CreateAt, &t.Name)
		if rErr!=nil{
			log.Println("Failed to scan groups, exiting")
			return nil, nil, rErr
		}
		resGroups = append(resGroups, t)
	}

	return resBeats, resGroups, nil

}

func (bs *beatService) CreateBeats(companyID int, name string) ([]models.Beat, []models.Group, error){

	_, err := bs.DB.Exec(`Insert into beat(name,addn1,addn2,companyid,short_name) values($1,$2,$3,$4,$5)`, name, "", "", companyID, name )

	if err!=nil{
		log.Println("Failed to create the beat, exiting", err.Error())
		return nil, nil, err
	}

	return bs.FetchBeatsAndGroups(companyID)

}