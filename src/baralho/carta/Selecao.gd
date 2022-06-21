extends Node2D

var x = 0
var y = 0

func _ready():
	pass

func _draw():
	draw_rect(Rect2( Vector2( -46, -60), Vector2( 90, 120)), Color.red)
