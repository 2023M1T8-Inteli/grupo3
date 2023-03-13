extends Node2D


func _ready(): #transição para sair da casa 
	pass 

func comecar(): #começar animação da cena 
	$ColorRect/AnimationPlayer.play("animacao")
	
func comecar_reverso(): #começar animação reversa pra sair da casa 
	$ColorRect/AnimationPlayer.play_backwards("animacao")

func timer(): #começa o timer de 1s e aparece a casa
	$Timer.start()
	
func _on_Timer_timeout(): #quando o timer de 1s termina apaga a casa
	queue_free()
