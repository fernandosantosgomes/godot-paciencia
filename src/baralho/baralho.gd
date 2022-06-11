extends Node

#export (PackedScene) var Carta

var Carta = preload("res://src/baralho/carta/carta.tscn")

var deck

enum naipe { Hearts, Spades, Diamonds,	Clubs}

enum valor {Joker, _A, _2, _3, _4, _5, _6, _7, _8, _9, _10, _J, _Q, _K}

func _init():
	preenche_deck()

func preenche_deck():
	deck = []
	var carta
	for chave in valor:
		if chave == 'Joker':
			continue
		for np in naipe:
			carta = Carta.instance()
			carta.valor = chave.substr(1)
			carta.naipe = np
			var textura =  load("res://assets/cartas/card" + carta.naipe + carta.valor +".png")
			carta.textura_desvirada = textura
			deck.append(carta)
