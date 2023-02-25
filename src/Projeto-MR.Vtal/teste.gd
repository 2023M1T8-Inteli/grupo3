extends Node2D

func _ready():
	$AnimationPlayer/Sprite.hide()

func _on_Timer_timeout():
	$AnimationPlayer/Sprite.show()
	$AnimationPlayer.play("New Anim")
	
