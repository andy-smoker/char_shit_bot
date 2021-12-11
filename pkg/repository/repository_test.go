package repository

import (
	"testing"

	"github.com/go-playground/assert/v2"
)

func TestDCCdb(t *testing.T) {
	sql, err := NewDCC("../../char_shit.db")
	t.Log(err, sql)
	assert.Equal(t, sql != nil, true)
	assert.Equal(t, err != nil, false)
}

func TestGetPet(t *testing.T) {
	db, _ := NewDCC("../../char_shit.db")
	pet, err := db.GetPet(1)
	assert.Equal(t, err == nil, true)
	assert.Equal(t, pet, "Собака")
}

func TestGetForCart(t *testing.T) {
	db, _ := NewDCC("../../char_shit.db")
	some, err := db.GetForCart(3)
	t.Log(some)
	assert.Equal(t, err == nil, true)
	assert.Equal(t, some, "В телеге: Солома")
}
