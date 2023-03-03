extends Node2D

func _ready():
	pass
	
func _on_Situacao_body_entered(body):
	get_tree().change_scene("res://cenas/situacoes/Situação1.tscn")
	get_parent().remove_child($Situacao)
