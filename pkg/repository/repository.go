package repository

import (
	"fmt"
	"os"

	"github.com/jmoiron/sqlx"
	_ "github.com/mattn/go-sqlite3"
)

type DCCCrowler struct {
	Class       string `db:"name"`
	WeaponID    string `db:"weapon_id"`
	WeaponTitle string `db:"weapon_title"`
	Weapon      DCCWeapon
	Things      string `db:"things"`
}

type DCCWeapon struct {
	Title   string `db:"title"`
	OneHand string `db:"one_hand"`
	TwoHand string `db:"two_hand"`
	Shoot   string `db:"shoot"`
	Range   string `db:"range"`
}

type DCCdb struct {
	*sqlx.DB
}

// NewConnSQLite создаём подключение к нашей базе данных
func NewConnSQLite(path string) (*sqlx.DB, error) {
	return sqlx.Connect("sqlite3", path) // "char_shit.db")
}

func NewDCC(path string) (*DCCdb, error) {
	if _, err := os.Stat(path); os.IsNotExist(err) {
		return nil, fmt.Errorf("SQLite err:%s", err.Error())
	}
	db, err := NewConnSQLite(path)
	if err != nil {
		fmt.Println(err)
		return nil, err
	}
	return &DCCdb{db}, nil
}

func (db *DCCdb) GetClass(id int) (*DCCCrowler, error) {
	crowler := &DCCCrowler{}
	err := db.Get(crowler, "SELECT name,weapon_id, weapon_title,things FROM occupations WHERE id = $1", id)
	if err != nil {
		return nil, err
	}
	err = db.Get(&crowler.Weapon, "SELECT * FROM weapons WHERE title = $1", crowler.WeaponID)
	if err != nil {
		return nil, err
	}
	return crowler, nil
}

func (db *DCCdb) GetPet(id int) (string, error) {
	var pet string
	err := db.Get(&pet, "SELECT value FROM pets WHERE id = $1", id)
	if err != nil {
		return pet, err
	}
	return pet, nil
}

func (db *DCCdb) GetForCart(id int) (string, error) {
	var some string
	err := db.Get(&some, "SELECT value FROM cart WHERE id = $1", id)
	if err != nil {
		return some, err
	}
	return "В телеге: " + some, nil
}
