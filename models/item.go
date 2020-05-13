package models

type StockItem struct {
	ID string `json:"id"`
	Name string `json:"name"`
	Alias string `json:"alias"`
	Description string `json:"description"`
	Rate float64 `json:"rate"`
	MRP float64 `json:"mrp"`
	Unit StockUnit `json:"unit"`
	ProductCompany ProductCompany `json:"product_company"`
	ProductCategory ProductCategory `json:"product_category"`
}

type StockUnit struct {
	GeneralUnit
	Symbol string `json:"symbol"`
}

type GeneralUnit struct {
	ID int64 `json:"id"`
	Name string `json:"name"`
}

type ProductCompany struct {
	GeneralUnit
}

type ProductCategory struct {
	GeneralUnit
}
//
//func fetchStockItems(db *sql.DB) ([]StockItem, error){
//
//	// fetch all the items
//	//var items []StockItem
//	//
//	//rows, err := db.Query(`SELECT * from stockitem`)
//	//if err!= nil{
//	//	return nil, err
//	//}
//	//
//	////for rows.Next(){
//	////	var readItem StockItem
//	////	var unitID int64
//	////	var companyID int64
//	////	var categoryID int64
//	////	readError := rows.Scan(&readItem.ID, &readItem.Name, &readItem.Alias, &readItem.Description,
//	////		&readItem.Rate, &readItem.MRP, &unitID, &companyID, &categoryID)
//	////
//	////}
//
//
//
//}
