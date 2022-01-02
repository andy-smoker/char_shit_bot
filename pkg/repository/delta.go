package repository

import (
	"github.com/jmoiron/sqlx"
	_ "github.com/mattn/go-sqlite3"
)

type DeltaDB struct {
	*sqlx.DB
}

func (db *DeltaDB) GetOccupation() {

}
