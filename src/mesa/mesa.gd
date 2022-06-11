extends Node

var baralho
var mesa_baixo
var mesa_cima

func _init():
	baralho = preload("res://src/baralho/baralho.gd").new().deck
	mesa_baixo = []
	mesa_cima = []
