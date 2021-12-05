package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetOneStat(t *testing.T) {
	assert.Equal(t, true, rollOneStat() > 0)
}

func TestGetClass(t *testing.T) {
	db := NewDB()
	testCrowler := &Crowler{
		Class:       "Кузнец",
		WeaponID:    "Дубинка",
		WeaponTitle: "Молоток",
		Weapon: Weapon{
			Title:   "Дубинка",
			OneHand: "1d4",
			TwoHand: "-",
			Shoot:   "-",
			Range:   "-",
		},
		Things: "Стальные клещи",
	}
	ttt, _ := db.GetClass(8)
	assert.Equal(t, testCrowler, ttt)
	//t.Error(db.GetClass(8))
}
