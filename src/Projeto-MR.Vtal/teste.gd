extends Node2D

const Arrow = preload("res://Arrow.tscn")
var arrow = null
var obj_pos = Vector2(0,0)
var mouse_pos = Vector2(0,0)

func _ready():
	arrow = Arrow.instance()
	add_child(arrow)
	
func _process(delta):
	obj_pos = arrow.get_global_position()
	mouse_pos = $Personagem.get_position()
	arrow.set_rotation((mouse_pos - obj_pos).angle())
