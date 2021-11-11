package main

import (
	"context"
	"fmt"
	"log"
	"time"

	"math/rand"

	"github.com/jmoiron/sqlx"
	_ "github.com/mattn/go-sqlite3"

	"github.com/BurntSushi/toml"
	telebot "github.com/go-telegram-bot-api/telegram-bot-api"
)

type Bot struct {
	api      *telebot.BotAPI
	ctx      context.Context
	tgUpdate telebot.UpdateConfig
	DB       *SQLite
}

type Crowler struct {
	Class       string `db:"name"`
	WeaponID    string `db:"weapon_id"`
	WeaponTitle string `db:"weapon_title"`
	Weapon      Weapon
	Things      string `db:"things"`
}

type Weapon struct {
	Title   string `db:"title"`
	OneHand string `db:"one_hand"`
	TwoHand string `db:"two_hand"`
	Shoot   string `db:"shoot"`
	Range   string `db:"range"`
}

// обязательно публиный
type Config struct {
	Token string `toml:"token"`
}

func main() {
	tmp := &Config{}
	_, err := toml.DecodeFile("config.toml", tmp)
	if err != nil {
		log.Println(err)
		return
	}
	fmt.Println(tmp)
	b := new(Bot)
	b.api, _ = telebot.NewBotAPI(tmp.Token)
	b.ctx = context.Background()
	b.tgUpdate = telebot.NewUpdate(0)
	b.tgUpdate.Timeout = 60
	updates, err := b.api.GetUpdatesChan(b.tgUpdate)
	if err != nil {
		log.Println(err)
		return
	}
	b.DB = NewDB()
	for u := range updates {
		if u.Message != nil {
			if u.Message.IsCommand() {
				msg := telebot.NewMessage(u.Message.Chat.ID, "Напиши имя теперь")
				b.api.Send(msg)
			}
			msg := telebot.NewMessage(u.Message.Chat.ID, b.CreateCrowler(u.Message.Text))
			b.api.Send(msg)
		}
	}

}

func (b *Bot) CreateCrowler(name string) string {
	crowler, err := b.DB.GetClass()
	if err != nil {
		log.Println(err)
		return "Давай снова, то я xто-то туплю"
	}
	fmt.Println(crowler)
	weapon := crowler.WeaponTitle
	if crowler.Weapon.OneHand != "-" {
		weapon += fmt.Sprintf("\n Одноручное. Урон %s", crowler.Weapon.OneHand)
	}
	if crowler.Weapon.TwoHand != "-" {
		weapon += fmt.Sprintf("\n Двуручное. Урон %s", crowler.Weapon.TwoHand)
	}
	if crowler.Weapon.Shoot != "-" {
		weapon += fmt.Sprintf("\n  Дальний бой. Урон %s Дистанция %s ", crowler.Weapon.Shoot, crowler.Weapon.Range)
	}
	return fmt.Sprintf(`%s
Профессия: %s
Оружие: %s
Вещи: %s
%s
	`, name, crowler.Class, weapon, crowler.Things, GetRandomStats())
}

func GetRandomStats() string {
	rand.Seed(time.Now().UnixNano())

	return fmt.Sprintf(`Характеристики
Сила:  %d
Стойкость: %d
Ловкость: %d
Мудрость: %d
Интеллект %d
Харизма: %d
	`, 3+rand.Intn(15), 3+rand.Intn(15), 3+rand.Intn(15), 3+rand.Intn(15), 3+rand.Intn(15), 3+rand.Intn(15))
}

// -------------------------------------------------------------------------------------------

type SQLite struct {
	*sqlx.DB
}

// NewConnSQLite создаём подключение к нашей базе данных
func NewConnSQLite() (*sqlx.DB, error) {
	return sqlx.Connect("sqlite3", "char_shit.db")
}

func NewDB() *SQLite {
	db, err := NewConnSQLite()
	if err != nil {
		log.Println(err)
	}
	return &SQLite{db}
}

func (db *SQLite) GetClass() (*Crowler, error) {
	tmp := &Crowler{}
	rand.Seed(time.Now().UnixNano())
	rnd := 1 + rand.Intn(99)

	err := db.Get(tmp, "SELECT name,weapon_id, weapon_title,things FROM occupations WHERE id = $1", rnd)
	if err != nil {
		return nil, err
	}
	fmt.Println(tmp)
	err = db.Get(&tmp.Weapon, "SELECT * FROM weapons WHERE title = $1", tmp.WeaponID)
	if err != nil {
		return nil, err
	}
	if tmp.Things == "Pet" {
		rnd := 1 + rand.Intn(7)
		err = db.Get(&tmp.Things, "SELECT value FROM pets WHERE id = $1", rnd)
		if err != nil {
			return nil, err
		}
	}
	if tmp.Things == "Cart" {
		rnd := 1 + rand.Intn(5)
		err = db.Get(&tmp.Things, "SELECT value FROM cart WHERE id = $1", rnd)
		if err != nil {
			return nil, err
		}
		tmp.Things = "В телеге " + tmp.Things
	}
	return tmp, nil
}
