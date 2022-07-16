package controllers

import (
	"andy-smoker/char_shit_bot/pkg/dcc"
	"andy-smoker/char_shit_bot/pkg/diceroll"
	"andy-smoker/char_shit_bot/pkg/repository"
	"fmt"
	"strings"
)

func Middleware(input string, sqlCfgPath string) string {
	cmd := strings.Split(input, " ")
	text := ""
	switch cmd[0] {
	case "/dcc_gen":
		db, err := repository.NewDCC(sqlCfgPath)
		if err != nil {
			return ""
		}
		text = dcc.CreateCrowler(strings.Join(cmd[1:], " "), db)

	case "/roll":
		tmp := cmd[1:]
		for _, t := range tmp {
			total, dices := diceroll.RollDices(t)
			if dices == nil {
				return "Nothing"
			}
			for _, d := range dices {
				text += fmt.Sprintf("%d ", d)
			}
			text += total
		}
	}
	return text
}
