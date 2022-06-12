extends Node2D

var valor
var naipe
var virada = false
var cor_atraz
var textura_desvirada
var textura_virada
var mouse_enter = false

func _ready(): 
	$Sprite.texture = textura_desvirada


func _process(delta):
	if Input.is_action_pressed("click"):
		position = get_global_mouse_position()
		
func _on_Coliso_mouse_entered():
	mouse_enter = true


func _on_Coliso_mouse_exited():
	mouse_enter = false
