extends Node2D

var valor
var naipe
var virada = false
var cor_atraz
var textura_desvirada
var textura_virada
var mouse_enter = false

signal entrou_carta
signal saiu_carta

func _ready(): 
	$Sprite.texture = textura_desvirada


func _process(delta):
	if Input.is_action_pressed("click") and mouse_enter:
		position = get_global_mouse_position()
		
func _on_Coliso_mouse_entered():
	emit_signal("entrou_carta")


func _on_Coliso_mouse_exited():
	emit_signal("saiu_carta")


func _on_Carta_entrou_carta():
	mouse_enter = true


func _on_Carta_saiu_carta():
	mouse_enter = false
