extends Node2D

var velocity = Vector2.ZERO
var speed = 7

func _ready():
	position = Vector2(0,0)
	rand_position()
	
func _process(delta):
	mover()
	
func mover():
	velocity.x = -1
	velocity.x = velocity.x * speed
	position.x += velocity.x
	
func rand_position():
	position.y += rand_range(-180, 120)
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
