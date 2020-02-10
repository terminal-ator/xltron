package models

import "database/sql"

type Bank struct {
	ID        int32          `json:"id"`
	Name      string         `json:"name"`
	CreatedAt sql.NullString `json:"created_at"`
}
