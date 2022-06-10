extends Node

var valor
var naipe
var virada = false
var cor_atraz
var textura_desvirada
var textura_virada

func _ready(): 
	$Sprite.texture = textura_desvirada
