package controllers

import (
	"andy-smoker/char_shit_bot/pkg/dcc"
	"andy-smoker/char_shit_bot/pkg/repository"
	"strings"
)

func Middleware(input string, sqlCfgPath string) string {
	cmd := strings.Split(input, " ")
	switch cmd[0] {
	case "/dcc_gen":
		db, err := repository.NewDCC(sqlCfgPath)
		if err != nil {
			return ""
		}
		return dcc.CreateCrowler(strings.Join(cmd[1:], " "), db)

	}
	return ""
}
