package main

import (
	"fmt"
	"github.com/terminal-ator/xltron/api"
	"github.com/terminal-ator/xltron/models"
	"log"
	"strings"

	"github.com/gin-gonic/gin"
)

type CreateMasterReq struct {
	Name          string `json:"name"`
	GroupID       int64  `json:"group_id"`
	BeatID        int64  `json:"beat_id"`
	InterfaceCode string `json:"i_code"`
	Opening float64 `json:"opening"`
}

func PostCreateMaster(c *gin.Context) {

	// parse the request
	var req CreateMasterReq
	err := c.BindJSON(&req)

	company := c.Param("company")

	if err != nil {
		log.Println(err.Error())
		c.String(403, "Invalid request")
		return
	}

	trx, err := DB.Begin()

	if err != nil {
		log.Println(err.Error())
		c.String(500, "Internal server error")
		return
	}

	row := trx.QueryRow(`INSERT INTO
    					ACCOUNT_MASTER(name, cust_id, beatid, groupid, companyid, isactive, opening)
						values($1,$2,$3,$4,$5,$6, $7) returning id`, req.Name, 99999, req.BeatID, req.GroupID, company, true, req.Opening)

	var rowID int64
	err = row.Scan(&rowID)

	if err != nil {
		ErrorHandler(err, c, "Error")
		trx.Rollback()
		return
	}

	// create a account entry

	_, err = trx.Exec(`INSERT INTO ACCOUNTS(name, ismaster, interfacecode, masterid) values($1,1,$2,$3)`,
		req.Name, req.InterfaceCode, rowID)

	if err != nil {
		ErrorHandler(err, c, "Error while creating account")
		trx.Rollback()
		return
	}

	// commit
	trx.Commit()
	c.JSON(200, gin.H{"cust_id": rowID})
}

func UpdateMaster(c *gin.Context) {

	var Master models.Master
	//x, _ := c.GetRawData()
	//log.Println("Outputting body of request: ", x)
	err := c.BindJSON(&Master)
	if err != nil {
		ErrorHandler(err, c, "Body to json error")
		return
	}

	if Master.CustID.Int64 == 0 {
		company := c.Param("company")
		var req = Master
		if err != nil {
			log.Println(err.Error())
			c.String(403, "Invalid request")
			return
		}

		trx, err := DB.Begin()

		if err != nil {
			log.Println(err.Error())
			c.String(500, "Internal server error")
			return
		}

		row := trx.QueryRow(`INSERT INTO ACCOUNT_MASTER(name, cust_id, beatid, groupid, companyid, isactive)
						values($1,$2,$3,$4,$5,$6) returning id`, req.Name, 99999, req.BeatID, req.GroupID, company, true)

		var rowID int64
		err = row.Scan(&rowID)

		if err != nil {
			ErrorHandler(err, c, "Error")
			trx.Rollback()
			return
		}

		// create a account entry

		_, err = trx.Exec(`INSERT INTO ACCOUNTS(name, ismaster, interfacecode, masterid) values($1,1,$2,$3)`,
			req.Name, req.InterfaceCode, rowID)

		if err != nil {
			ErrorHandler(err, c, "Error while creating account")
			trx.Rollback()
			return
		}

		// commit
		trx.Commit()
		c.JSON(200, gin.H{"cust_id": rowID})

		return
	}

	var oldMaster models.Master

	row := DB.QueryRow(`SELECT id, name, beatid, groupid, companyid from account_master where id=$1`, Master.CustID.Int64)

	err = row.Scan(&oldMaster.CustID, &oldMaster.Name, &oldMaster.BeatID, &oldMaster.GroupID, &oldMaster.CompanyID)

	if err != nil {
		ErrorHandler(err, c, "Scanning Master")
		return
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

	paramQuery := strings.Join(params, ",")
	updateQuery += paramQuery
	updateQuery += fmt.Sprintf(" WHERE ID = $%d", paramCount)
	param = append(param, oldMaster.CustID.Int64)

	log.Println(updateQuery)

	// run the update
	if len(param) > 0 {
		_, err = DB.Exec(updateQuery, param...)
		if err != nil {
			ErrorHandler(err, c, "While executing update")
			return
		}
	} else {
		c.String(400, "No parameters to update")
	}

	mstr, err := models.GetMaster(DB, Master.CustID.Int64)

	if err != nil {
		ErrorHandler(err, c, "While fetching error")
		return
	}


	// update balance.
	balanceError := api.PostEditOpeningBalance(DB, mstr.ID, Master.OpeningBalance)

	if balanceError!=nil{
		log.Println("Failed to update opening balance.")
	}


	c.JSON(200, mstr)

}
