extends Node

#export (PackedScene) var Carta

var Carta = preload("res://src/carta.tscn")

var deck

enum naipe { COPAS,	PAUS, OURO,	ESPADAS}

enum valor {CURINGA, AS, DOIS, TREZ, QUATRO, CINCO, SEIS, SETE, OITO, NOVE, DEZ, VALETE, RAINHA, REI}

func _init():
	preenche_deck()

func preenche_deck():
	deck = []
	var carta
	for chave in valor:
		if chave == 'CURINGA':
			continue
		for np in naipe:
			carta = Carta.instance()
			carta.valor = chave
			carta.naipe = np
			deck.append(carta)
