package tests

import (
	"database/sql"
	_ "github.com/lib/pq"
	"github.com/terminal-ator/xltron/api"
	"testing"
)

func TestGetStatements(t *testing.T){

	// construct db connection
	connStr := "user=administrator password=Hxllx@wxrld dbname=postgres sslmode=disable"
	db, err := sql.Open("postgres", connStr)
	if err!=nil{
		t.Error("Unable to connect to the database")
	}
	defer db.Close()
	statementService := api.ConstructStatementService(db,"Fake table")

	stats, err := statementService.FetchStatementsForBankDateWise(1,8318,
		"2020-12-01", "2021-01-01")

	if err!=nil{
		t.Error("Unable to fetch the statements")
	}

	if len(stats)!=110{
		t.Error("The length of result does not match")
	}
	t.Logf("%v", stats[0])
}

func TestGetStatementsWithoutDate(t *testing.T){

	// construct db connection
	connStr := "user=administrator password=Hxllx@wxrld dbname=postgres sslmode=disable"
	db, err := sql.Open("postgres", connStr)
	if err!=nil{
		t.Error("Unable to connect to the database")
	}
	defer db.Close()
	statementService := api.ConstructStatementService(db,"Fake table")

	stats, err := statementService.FetchStatementsForBankDateWise(1,8318,
		"", "")

	if err!=nil{
		t.Error("Unable to fetch the statements")
	}

	if len(stats)!=0{
		t.Error("The length of result does not match")
	}
	t.Log(len(stats))
	//t.Logf("%v", stats[0])
}

func TestMoveStatementToVoucher(t *testing.T){

	// construct db connection
	connStr := "user=administrator password=Hxllx@wxrld dbname=postgres sslmode=disable"
	db, err := sql.Open("postgres", connStr)
	if err!=nil{
		t.Error("Unable to connect to the database")
	}
	defer db.Close()
	statementService := api.ConstructStatementService(db,"Fake table")

	 err = statementService.MoveFromStatementToVoucher(
	 		1572,
	 		6418,
	 		1,
	 		8318,
	 	)

	if err!=nil{
		t.Error("Unable to fetch the statements")
	}
	//t.Logf("%v", stats[0])
}
