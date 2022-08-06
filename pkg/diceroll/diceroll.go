package diceroll

import (
	"fmt"
	"math/rand"
	"strconv"
	"strings"
	"time"
)

// NewRoll
// count - количество кубов
// val - количество гранией куба
func NewRoll(count, val int) []int {
	var res []int
	for i := 0; i < count; i++ {
		rand.Seed(time.Now().UnixMilli())
		// делаем задержку для добавления рандома, чем меньше задержка тем меньше вариаций
		diration := time.Duration(1031)
		res = append(res, (rand.Intn(val) + 1))
		// для бота эта задержка не заметна
		time.Sleep(time.Microsecond * diration)
	}
	return res
}

type Config struct {
	ID     string `toml:"discord_id"`
	Token  string `toml:"token"`
	UserID string `toml:"user_id"`
}

func RollDices(text string) (string, []int) {
	var (
		count int
		res   []int
		total int
	)
	tmp := strings.Split(text, "D")
	if len(tmp) != 2 {
		tmp = strings.Split(text, "d")
		if len(tmp) != 2 {
			return "", nil
		}
	}
	if tmp[1] == "" {
		return "", nil
	} else if tmp[0] == "" {
		count = 1
	} else {
		count, _ = strconv.Atoi(tmp[0])
	}
	v, a, sign := mathSign(tmp[1])
	val, _ := strconv.Atoi(v)
	dices := NewRoll(count, val)
	for _, d := range dices {
		total += d
		res = append(res, d)
	}
	total = mathOp(sign, total, a)
	return fmt.Sprintf("%s%d {%d} | ", sign, a, total), res
}

func mathSign(text string) (string, int, string) {
	var (
		ident string
		vals  []string
		arg   int
	)
	signs := []string{"+", "-", "/", "*"}
	for _, s := range signs {
		vals = strings.Split(text, s)
		if len(vals) == 2 && vals[1] != "" {
			ident = s
			arg, _ = strconv.Atoi(vals[1])
			break
		}
	}
	fmt.Println("mathSign - ", vals[0], arg, ident)
	return vals[0], arg, ident
}

func mathOp(sign string, val, arg int) int {
	fmt.Println(sign, val, arg)
	var res int = val
	switch sign {
	case "+":
		res += arg
	case "-":
		res -= arg
	case "*":
		res *= arg
	case "/":
		res /= arg
	}
	fmt.Println("mathOp - ", res)
	return res
}
