extends Node2D

var valor
var naipe
var virada = false
var cor_atraz
var textura_desvirada
var textura_virada
var selecionada

var referencia_mesa

func _ready():
	selecionada = false
	$Sprite.texture = textura_desvirada
	referencia_mesa = get_node("../../").mesa

func _on_Coliso_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		referencia_mesa.carta_selecionada()
		selecionada = true
		print_debug( valor, " ", naipe)
		
func _process(delta):
	$Selecao.visible = selecionada
	if selecionada:
		referencia_mesa.move_child( self, referencia_mesa.todas_cartas.size()-1)
