extends Node

var valor
var naipe
var virada = false
var cor_atraz
var textura_desvirada =  load("res://assets/cartas/cardClubs3.png")
var textura_virada

func _ready():
	$Sprite.texture = textura_desvirada
