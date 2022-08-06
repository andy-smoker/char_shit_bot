package dcc

import (
	"andy-smoker/char_shit_bot/pkg/repository"
	"fmt"
	"log"
	"math/rand"
	"time"
)

type Crowler struct {
	Class       string
	WeaponID    string
	WeaponTitle string
	Weapon      Weapon
	Things      string
}

type Weapon struct {
	Title   string
	OneHand string
	TwoHand string
	Shoot   string
	Range   string
}

func CreateCrowler(name string, db *repository.DCCdb) string {
	rand.Seed(time.Now().UnixNano())
	rnd := 1 + rand.Intn(100)
	crowler, err := db.GetClass(rnd)
	if err != nil {
		log.Println(err)
		return "Давай снова, то я что-то туплю"
	}
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

	switch crowler.Things {
	case "Pet":
		crowler.Things, err = db.GetPet(1 + rand.Intn(8))
		if err != nil {

		}
	case "Cart":
		crowler.Things, err = db.GetForCart(1 + rand.Intn(6))
		if err != nil {

		}
	}
	return fmt.Sprintf(`%s
Профессия: %s
Оружие: %s
Имущество: %s
%s
	`, name, crowler.Class, weapon, crowler.Things, getRandomStats())
}

func rollOneStat() int {
	var (
		stat int
	)
	//dice = append(dice, rand.Intn(5)+1, rand.Intn(5)+1, rand.Intn(5)+1, rand.Intn(5)+1)
	rand.Seed(time.Now().UnixNano())
	for i := 0; i < 4; i++ {
		tmp := rand.Intn(6) + 1
		time.Sleep(time.Nanosecond * 19)
		stat += tmp
	}
	return stat
}

func getRandomStats() string {
	return fmt.Sprintf(`Характеристики
Сила:  %d
Стойкость: %d
Ловкость: %d
Мудрость: %d
Интеллект %d
Харизма: %d
	`, rollOneStat(), rollOneStat(), rollOneStat(), rollOneStat(), rollOneStat(), rollOneStat())
}
