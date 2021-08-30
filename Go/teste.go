package main

import (
	"fmt"
	"time"
)

type Drink struct {
	name string
	complete chan string
}

type Barista struct {
	name   string
	orders chan string
	drinks chan string
}

var drinks = map[string]int{
	"Flat white": 2,
	"Filter": 4,
}

func (b Barista) makeDrink(name string) {
	fmt.Println(b.name, "making", name)
	time.Sleep(time.Second * time.Duration(drinks[name]))
}

func (b Barista) waitForOrders() {
	for {
	  fmt.Println(b.name, "waiting for orders")
	  drink := <-b.orders
	  b.makeDrink(drink.name)
	  drink.complete <- drink.name
	}
}

func NewBarista(name string, orders chan string, drinks chan string) Barista {
	b := Barista{name, orders, drinks}
	go b.waitForOrders()
	return b
}

type Customer struct {
	name   string
	orders chan string
	drinks chan string
}

func (c Customer) collectDrink(complete chan string) {
	fmt.Println(c.name, "waiting to collect drink")
	drink := <-complete
	fmt.Println(c.name, "collected a", drink)
}

func (c Customer) order(name string) {
	fmt.Println(c.name, "ordered a", name)
	complete := make(chan string)
	drink := Drink{name, complete}
	c.orders <- drink
	go c.collectDrink(complete)
}

func NewCustomer(name string, orders chan string, drinks chan string) Customer {
	c := Customer{name, orders, drinks}
	return c
}

func main() {
	orders := make(chan string)
	drinks := make(chan string)
	NewBarista("Rob", orders, drinks)
	NewBarista("Pete", orders, drinks)
	c1 := NewCustomer("Rachid", orders, drinks)
	c2 := NewCustomer("Rich", orders, drinks)
	
	c1.order("Filter")
	c2.order("Flat white")
	time.Sleep(time.Second * 10)
}