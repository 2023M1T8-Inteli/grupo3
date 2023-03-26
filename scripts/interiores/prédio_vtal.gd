extends Node2D

func _ready():
	Global.camera_state = Global.StateCameraClamp.Off

func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn")
