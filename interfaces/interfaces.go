package interfaces

import "database/sql"

type Queryable interface {
	Exec(query string, args ...interface{}) (sql.Result, error)
	Query(query string, args ...interface{})(*sql.Rows, error)
}
