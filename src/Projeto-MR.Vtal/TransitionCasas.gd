extends Node2D


func _ready():
	pass # Replace with function body.

func comecar():
	$ColorRect/AnimationPlayer.play("animacao")
	
func comecar_reverso():
	$ColorRect/AnimationPlayer.play_backwards("animacao")

func timer():
	$Timer.start()
	
func _on_Timer_timeout():
	queue_free()
