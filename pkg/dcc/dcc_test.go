package dcc

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestOneRoll(t *testing.T) {
	for i := 0; i < 10; i++ {
		i := rollOneStat()
		t.Log(i)
		assert.Equal(t, i, 10)
	}
}
