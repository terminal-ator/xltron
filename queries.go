package main

const ALL_STATEMENT = `
	Select 
		id, narration, date, refno, created_at,  cust_id,
		deposit, withdrawl, bank_id
		from statement order by date desc
		limit 1000
`

const ALL_STATEMENT_WITH_COMPANY_AND_BANK = `
	select S.*, T.name from 
		(select A.id, A.narration, A.date, A.refno, A.created_at,
			A.cust_id, A.deposit, A.withdrawl, A.bank_id, A.company_id,
			B.name, B.year from statement A 
			inner join 
			company B
			on A.company_id = B.id
			where company_id=$1) s
		inner join
		banks T
		on s.bank_id = t.id
		order by S.date,S.deposit, S.withdrawl
`

const BANK_WISE_STATEMENT = `
	Select 
		id, narration, date, refno, created_at,  cust_id,
		deposit, withdrawl, bank_id, company_id
		from statement where bank_id=$1 order by date, withdrawl, deposit
`
const ID_WISE_STATEMENT = `
	Select
		id, narration, date, refno, created_at, cust_id, deposit, withdrawl,
		bank_id, company_id
		from statement where id=$1
`
const CREATE_NEW_MASTER = `
			INSERT INTO masters(
				cust_id,
				name,
				ismaster,
				company_id,
				interface_code,
				chq_flg,
				group_id,
				is_new
			)
			SELECT MAX(cust_id)+1,$1,1,$2,'TALLY',1,$3,1
			FROM masters where company_id = $2
`

const CREATE_FILE = `INSERT INTO files_table(location, original, filename, company, company_id)
					values($1, $2, $3, $4, $5)`

const INSERT_LEDGER = `Insert into ledger(master_name, ledger_type,
				 ledger_date, ledger_no, to_customer, company_id, cust_id, master_id) 
				 values($1, $2, $3, $4, $5, $6, $7, $8)`

const GET_LEDGER = `SELECT id,cust_id, ledger_type, ledger_date, ledger_no, associated_id, 
										to_customer, from_customer, company_id from ledger where cust_id = $1 
										and company_id = $2`
const GET_ACCOUNT = `SELECT 
					 a.id, b.date, b.id, b.narration, b.refno, b.sttmt_id,a.amount
					 FROM POSTING a
					 INNER JOIN
					 JOURNAL b on a.journalid = b.id
					 WHERE a.masterid = $1
					 AND b.date >= (sele 
					 order by b.date desc`

// const INSERT_LEDGER = `INSERT into cash_statement(cust_id, narration, date, refno, withdrawl )`
