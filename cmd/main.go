package main

import (
	"andy-smoker/char_shit_bot/pkg/tgbot"
	"flag"
)

var (
	tgToken    string
	sqlitePath string
)

func init() {
	flag.StringVar(&tgToken, "tg-token", "bot:token", "telegram token")
	flag.StringVar(&sqlitePath, "sqlite", "123456789", "sqlite db filepath")
}

func main() {
	flag.Parse()
	bot := tgbot.NewBot(tgToken)
	bot.Start()
}
