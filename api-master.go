package main

import (
	"log"

	"github.com/gin-gonic/gin"
)

type CreateMasterReq struct {
	Name          string `json:"name"`
	GroupID       int64  `json:"group_id"`
	BeatID        int64  `json:"beat_id"`
	InterfaceCode string `json:"i_code"`
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
}
