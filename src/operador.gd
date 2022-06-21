extends Node2D

var mesa

var modo = { 'uma': 1, 'trez': 3}
var modo_jogo# trez ou uma carta(s)
var versao_mobile = false

func _ready():
	randomize()
	mesa = preload("res://src/mesa/mesa.gd").new()
	#exibe_cartas(mesa.baralho)
	mesa.baralho = enbaralhar(mesa.baralho)
	mesa.coloca_carta_mesa(mesa.baralho)
	inicia_mesa_baixo()
	ajustar_modo_jogo(modo.trez)
	add_child(mesa)
	testes_main()
	
func testes_main():
	var carta = mesa.get_carta('A', 'Clubs')
	mesa.move_child( carta, mesa.todas_cartas.size()-1)

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
		

func _input(event):
	
	if event is InputEventMouseMotion:
		for carta_selecionada in mesa.todas_cartas:
			if carta_selecionada.selecionada and ( Input.is_action_pressed("click") or versao_mobile):
				var tamanho_tela = get_viewport_rect().size
				carta_selecionada.position += event.relative
				carta_selecionada.position.x = clamp( carta_selecionada.position.x, 80, tamanho_tela.x - 80)
				carta_selecionada.position.y = clamp( carta_selecionada.position.y, 80, tamanho_tela.y - 80)
				
func exibe_cartas(baralho):
	for carta in baralho:
		print( carta.valor, ' ', carta.naipe)
