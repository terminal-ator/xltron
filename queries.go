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
		deposit, withdrawl, bank_id
		from statement where bank_id=$1 order by date desc
		limit 1000
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