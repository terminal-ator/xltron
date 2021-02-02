package api

import (
	"database/sql"
	"fmt"
	"github.com/terminal-ator/xltron/models"
	"log"
	"strings"
)

type MasterService interface {
	CreateMaster(master models.Master) (models.Master,error)
	UpdateMaster(master models.Master) (models.Master, error)
	GetMaster( masterID int64) (models.Master, error)
	GetMastersForCompany(companyID int) ([]models.Master, error)
}

type masterService struct{
	DB *sql.DB
}

func ConstructMasterService(db *sql.DB) masterService{
	return masterService{DB: db}
}

func (ms *masterService) CreateMaster(master models.Master) (models.Master,error){

	trx, _ := ms.DB.Begin()

	row := trx.QueryRow(`INSERT INTO
    					ACCOUNT_MASTER(name, cust_id, beatid, groupid, companyid, isactive, opening)
						values($1,$2,$3,$4,$5,$6, $7) returning id`,
						master.Name, 99999, master.BeatID, master.GroupID,
						master.CompanyID, true, master.OpeningBalance)

	var rowID int64
	err := row.Scan(&rowID)

	if err != nil {
		log.Println("Failed to create master", err.Error())
		trx.Rollback()
		return master,err
	}

	// create a account entry

	_, err = trx.Exec(`INSERT INTO ACCOUNTS(name, ismaster, interfacecode, masterid) values($1,1,$2,$3)`,
		master.Name, master.InterfaceCode, rowID)

	if err != nil {
		log.Println("Failed to create master", err.Error())
		trx.Rollback()
		return master,err
	}

	master.ID = int32(rowID)
	master.CustID.Int64 = rowID
	master.CustID.Valid = true
	// commit
	trx.Commit()

	return master,nil

}

func (ms *masterService) UpdateMaster(master models.Master) (models.Master, error){

	if master.CustID.Int64 == 0 {
		savedMaster, err := ms.CreateMaster(master)
		if err!=nil{
			log.Println("Failed to create master, exiting..", err.Error())
			return savedMaster, err
		}
		return savedMaster, nil
	}
	Master := master
	oldMaster, oldErr := ms.GetMaster(Master.CustID.Int64)

	if oldErr!=nil{
		return models.Master{}, oldErr
	}

	var param []interface{}
	paramCount := 1
	var params []string
	updateQuery := `UPDATE account_master set `

	if oldMaster.BeatID != Master.BeatID {
		tmpString := fmt.Sprintf("beatid = $%d", paramCount)
		params = append(params, tmpString)
		param = append(param, Master.BeatID)
		paramCount += 1
	}

	if oldMaster.GroupID != Master.GroupID {
		tmpString := fmt.Sprintf("groupid = $%d", paramCount)
		params = append(params, tmpString)
		param = append(param, Master.GroupID)
		paramCount += 1
	}

	if oldMaster.Name != Master.Name {
		tmpString := fmt.Sprintf("name=$%d", paramCount)
		params = append(params, tmpString)
		param = append(param, Master.Name)
		paramCount += 1
	}

	if oldMaster.OpeningBalance != Master.OpeningBalance{
		tmpString := fmt.Sprintf("opening=$%d", paramCount)
		params = append(params, tmpString)
		param = append(param, Master.OpeningBalance)
		paramCount += 1
	}

	paramQuery := strings.Join(params, ",")
	updateQuery += paramQuery
	updateQuery += fmt.Sprintf(" WHERE ID = $%d", paramCount)
	param = append(param, oldMaster.CustID.Int64)

	log.Println(updateQuery)

	if len(param) > 0 {
		_, err := ms.DB.Exec(updateQuery, param...)
		if err != nil {
			log.Println(err, "While executing update")
			return oldMaster,nil
		}
	} else {
		return master, nil
	}

	//mstr, _ := ms.GetMaster(oldMaster.CustID.Int64)

	//bError := PostEditOpeningBalance(ms.DB,mstr.ID, Master.OpeningBalance)
	//
	//if bError!=nil{
	//	log.Println("Failed to update opening balance")
	//}

	return master, nil


}

func (ms *masterService) GetMaster( masterID int64) (models.Master, error){

	var master models.Master
	row := ms.DB.QueryRow(`SELECT
       		id, name, beatid, groupid, companyid, opening
       		from account_master where id = $1`, masterID)
	err := row.Scan(&master.CustID, &master.Name, &master.BeatID,
		&master.GroupID, &master.CompanyID, &master.OpeningBalance)
	if err != nil{
		log.Println("No master found", err.Error())
		return master, err
	}

	master.ID = int32(master.CustID.Int64)
	return master, nil
}

func (ms *masterService) GetMastersForCompany(companyID int) ([]models.Master, error){

	query := `select 
       			account_master.id, account_master.name, account_master.companyid ,account_master.chq_flg, account_master.groupid ,
       			account_master.beatid, coalesce(sum(p.amount)+coalesce(account_master.opening,0),0), account_master.opening
					from account_master 
					    left outer join 
					    (select * from posting where id in (
							select p.id from journal inner join posting p on journal.id = p.journalid )) p
    					on account_master.id = p.masterid
    					where companyid = $1
						group by 
						    account_master.id, account_master.name,account_master.chq_flg, account_master.beatid, account_master.groupid 
						order by account_master.name`

	rows, err := ms.DB.Query(query, companyID)
	if err!=nil{
		return nil, err
	}
	masters := make([]models.Master, 0)
	for rows.Next() {
		var mstr models.Master
		err := rows.Scan(&mstr.CustID, &mstr.Name, &mstr.CompanyID, &mstr.ChequeFlag, &mstr.GroupID, &mstr.BeatID, &mstr.Balance, &mstr.OpeningBalance)
		if err!=nil{
			return nil, nil
		}
		masters = append(masters, mstr)
	}
	return masters,nil
}