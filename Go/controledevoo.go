package main

import (
	"fmt"
	"time"
)

type Pista struct {
	id int
	requisicao chan string
	permissao chan string
}

func (p Pista) requisicaoPista() {
	for{
		select{
		case x, ok := <- p.permissao:
			if ok {
				p.permissao <- x
			} else {
				fmt.Println("Pista em uso.")
			}
		default:
			fmt.Println("Sem valor. Continuando...")
		}

		p.permissao <- ("Pista liberada para ")
		requisicao := <- p.requisicao
	}
}

func NewPista(id int, requisicao, permissao chan string) Pista {
	p := Pista{id, requisicao, permissao}
	go p.requisicaoPista()
	return p
}

type Aviao struct {
	id int
	estado bool
	requisicao chan string
	permissao chan string
}

func (a Aviao) permissaoPouso() {
	fmt.Println("Aeronave", a.id, "aguardando liberação da pista.")
	permissao := <- a.permissao
	fmt.Println(permissao,"pouso da aeronave",a.id,".")
	
	a.estado <- false
}

func (a Aviao) permissaoDecolagem() {
	fmt.Println("Aeronave", a.id, "aguardando liberação da pista.")
	permissao := <- a.permissao
	fmt.Println(permissao,"decolagem da aeronave",a.id,".")

	a.estado <- true
}

func (a Aviao) pedirPermissao(requisicao string) {
	estado := <- a.estado
	if estado{
		fmt.Println("Aeronave", id, "pedindo permissão para pouso.")
		a.requisicao <- requisicao
		go a.permissaoPouso()
	}else {
		fmt.Println("Aeronave", id, "pedindo permissão para decolagem.")
		a.requisicao <- requisicao
		go a.permissaoDecolagem()
	}
}

func NewAviao(id int, estado bool, requisicao, permissao chan string) Aviao {
	a := Aviao{id, estado, requisicao, permissao}
	return a
}

func main() {
	requisicao := make(chan string)
	permissao := make(chan string, 2)

	NewPista(1, requisicao, permissao)
	c1 := NewAviao(1, true, requisicao, permissao)
	c2 := NewAviao(2, true, requisicao, permissao)
	c3 := NewAviao(3, true, requisicao, permissao)
	c4 := NewAviao(4, true, requisicao, permissao)
	c1.pedirPermissao("teste")
	c2.pedirPermissao("teste")
	c3.pedirPermissao("teste")
	c4.pedirPermissao("teste")
	time.Sleep(time.Second * 10)
}