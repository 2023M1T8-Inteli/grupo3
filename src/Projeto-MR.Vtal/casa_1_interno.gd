extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready(): #inicia transição para cena da casa 
	$Transition/Fill/animation.play_backwards("transicao")
	$Transition.timer()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout(): 
	pass # Replace with function body.


func _on_Area2D_body_entered(body): #transição para sair da casa e entrar no mapa 
#	Global.controle_false()
	get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn")
	 # Replace with function body.
