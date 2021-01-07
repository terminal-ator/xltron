package api

import (
	"github.com/terminal-ator/xltron/interfaces"

)

func PostEditOpeningBalance(DB interfaces.Queryable, masterid int32, balance float64) error{

	_, err := DB.Exec(`Update account_master
								set opening = $1 where masterid=$2`, balance, masterid)

	if err!=nil{
		return err
	}

	return nil
}
