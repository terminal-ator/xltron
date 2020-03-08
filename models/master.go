package models

import "database/sql"

// Master Structure for master
type Master struct {
	ID         int32          `json:"id"`
	CustID     sql.NullInt64  `json:"cust_id"`
	IsMaster   bool           `json:"is_master"`
	Name       string         `json:"name"`
	Address    sql.NullString `json:"address"`
	Area       sql.NullString `json:"area"`
	CreatedAt  sql.NullString `json:"created_at"`
	CompanyID  int32          `json:"company_id"`
	ChequeFlag int32          `json:"chq_flg"`
	GroupID    int32          `json:"group_id"`
	Balance    float64        `json:"balance"`
	BeatID     int64          `json:"beat_id"`
}
