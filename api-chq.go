package main

type ChqCreateReq struct {
	PostDate string `json:"post_date"`
	ChqNo    string `json:"chq_no"`
	BankName string `json:"bank_name"`
	ChqDate  string `json:"chq_date"`
	Name     string `json:"name"`
	Amount   string `json:"amount"`
	BankID   int64  `json:"bank_id"`
}
