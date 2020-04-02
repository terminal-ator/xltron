package models

import (
	"database/sql"
	"log"
)

// Master Structure for master
type Master struct {
	ID            int32          `json:"id"`
	CustID        sql.NullInt64  `json:"cust_id"`
	IsMaster      bool           `json:"is_master"`
	Name          string         `json:"name"`
	Address       sql.NullString `json:"address"`
	Area          sql.NullString `json:"area"`
	CreatedAt     sql.NullString `json:"created_at"`
	CompanyID     int32          `json:"company_id"`
	ChequeFlag    int32          `json:"chq_flg"`
	GroupID       int32          `json:"group_id"`
	Balance       float64        `json:"balance"`
	BeatID        int64          `json:"beat_id"`
	InterfaceCode string         `json:"i_code"`
}

func GetMaster(db *sql.DB, Id int64) (Master, error) {

	var master Master

	row := db.QueryRow(`SELECT id, name, beatid, groupid, companyid FROM account_master where id=$1`, Id)

	err := row.Scan(&master.CustID, &master.Name, &master.BeatID, &master.GroupID, &master.CompanyID)

	if err != nil {
		log.Println(err.Error())
		return master, err
	}

	return master, nil

}
