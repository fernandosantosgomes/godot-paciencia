extends Node2D

var baralho
var mesa_baixo
var mesa_cima

func _init():
	baralho = preload("res://src/baralho/baralho.gd").new().deck
	mesa_baixo = []
	mesa_cima = []
	#exibe_carta_mesa( "K", "Diamonds", Vector2( 200, 200))

func exibe_carta_mesa( valor, naipe, posicao : Vector2):
	var carta_tmp
	for carta in baralho:
		if valor == carta.valor and naipe == carta.naipe:
			carta_tmp = carta
			break
	carta_tmp.position = posicao
	add_child(carta_tmp)
