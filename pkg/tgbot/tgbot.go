package tgbot

import (
	"andy-smoker/char_shit_bot/pkg/controllers"
	"context"
	"fmt"
	"log"

	telebot "github.com/go-telegram-bot-api/telegram-bot-api"
)

type Bot struct {
	api      *telebot.BotAPI
	ctx      context.Context
	tgUpdate telebot.UpdateConfig
}

func NewBot(token string) *Bot {
	var (
		err error
	)
	bot := new(Bot)
	bot.api, err = telebot.NewBotAPI(token)
	if err != nil {
		fmt.Println("Telegram-API Token error:", err)
		return nil
	}
	bot.ctx = context.Background()
	bot.tgUpdate = telebot.NewUpdate(0)
	bot.tgUpdate.Timeout = 60
	return bot
}

func (b *Bot) SendMessage(text string) {

}

func (b *Bot) Start() {
	updates, err := b.api.GetUpdatesChan(b.tgUpdate)
	if err != nil {
		log.Println(err)
		return
	}
	for u := range updates {
		if u.Message != nil {
			text := controllers.Middleware(u.Message.Text, "char_shit.db")
			msg := telebot.NewMessage(u.Message.Chat.ID, text)
			b.api.Send(msg)
		}
	}
}
