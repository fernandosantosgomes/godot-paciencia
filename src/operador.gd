extends Node2D

var mesa

var modo = { 'uma': 1, 'trez': 3}
var modo_jogo# trez ou uma carta(s)

func _ready():
	randomize()
	mesa = preload("res://src/mesa/mesa.gd").new()
	#exibe_cartas(mesa.baralho)
	mesa.baralho = enbaralhar(mesa.baralho)
	inicia_mesa_baixo()
	ajustar_modo_jogo(modo.trez)
	mesa.exibe_carta_mesa( "K", "Diamonds", Vector2( 200, 200))
	#mesa.exibe_carta_mesa( "Q", "Diamonds", Vector2( 300, 200))
	add_child(mesa)

func ajustar_modo_jogo(modo):
	self.modo_jogo = modo
	

func quantidade_carta_deck():
	return len(mesa.baralho)
	
func quantidade_carta_mesa_baixo():
	var quant = 0
	for i in range(len(mesa.mesa_baixo)):
		quant += mesa.mesa_baixo[i].size()
	return quant

func _process(delta):
	pass

func inicia_mesa_cima():
	for i in range(4):
		mesa.mesa_cima.append([])

func inicia_mesa_baixo():
	for i in range(7):
		mesa.mesa_baixo.append([])
		
		for j in range(i + 1):
			mesa.mesa_baixo[i].append(mesa.baralho.pop_back())

func enbaralhar(baralho):
	var deck_temp = []
	
	while baralho.size() > 0:
		var valor_aleatorio = randi() % len(baralho)
		var topo_baralho = baralho.pop_at(valor_aleatorio)
		deck_temp.append(topo_baralho)
	return deck_temp
		

	
func exibe_cartas(baralho):
	for carta in baralho:
		print( carta.valor, ' ', carta.naipe)


func _on_Area2D_mouse_entered():
	print('ok')
