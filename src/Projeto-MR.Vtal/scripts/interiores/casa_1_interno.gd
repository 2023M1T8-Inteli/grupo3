extends Node2D

func _ready(): #inicia transição para cena da casa 
	$Transition/Fill/animation.play_backwards("transicao")
	$Transition.timer()

func _on_Area2D_body_entered(body): #transição para sair da casa e entrar no mapa 
	get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn")

