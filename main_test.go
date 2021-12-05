package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetOneStat(t *testing.T) {
	assert.Equal(t, true, rollOneStat() > 0)
}
