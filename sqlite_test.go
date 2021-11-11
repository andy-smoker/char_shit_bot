package main

import (
	"testing"
)

func TestGetClass(t *testing.T) {
	db := NewDB()
	t.Error(db.GetClass())
}
