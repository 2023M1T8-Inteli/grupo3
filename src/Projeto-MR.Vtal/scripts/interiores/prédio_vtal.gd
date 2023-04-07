extends Node2D

func _ready():
	$Personagem/Arrow.hide()
	Global.camera_state = Global.StateCameraClamp.Off
	$Transition/Fill/animation.play_backwards("transicao")

func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn")


func _on_Area2D2_body_entered(body):
	$Transition/Fill/animation.play("transicao")
	$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene("res://cenas/feedback/feedback.tscn")
