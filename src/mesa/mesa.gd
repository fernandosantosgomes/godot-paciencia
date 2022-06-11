extends Node2D

var baralho
var mesa_baixo
var mesa_cima

func _init():
	baralho = preload("res://src/baralho/baralho.gd").new().deck
	mesa_baixo = []
	mesa_cima = []
	coloca_carta_mesa()
	
func coloca_carta_mesa():
	for carta in baralho:
		carta.position = Vector2( 100, 120)
		add_child(carta)
#Toda movimentacao das cartas da mesa deve ser posta 
#areaves deste metodo.
func adiciona_mesa_baixo():	
	pass

func exibe_carta_mesa( valor, naipe, posicao : Vector2):
	var carta_tmp
	for carta in baralho:
		if valor == carta.valor and naipe == carta.naipe:
			carta_tmp = carta
			break
	
	for coluna in mesa_baixo:
		for carta in coluna:
			if valor == carta.valor and naipe == carta.naipe:
				carta_tmp = carta
				break
			
	carta_tmp.position = posicao
	add_child(carta_tmp)
