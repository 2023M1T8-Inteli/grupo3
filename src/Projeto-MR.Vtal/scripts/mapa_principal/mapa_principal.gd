extends Node2D

var dialogo = Global.falas["nathalia"]
var n = 0
var controle = Global.controle_nathalia

func _ready():
	$Transition/Fill/animation.play_backwards("transicao")
	$Transition.timer()
	$Dialogo.hide()
	if controle == true:
		$Dialogo/texto.text = dialogo[0]
		$Dialogo.show()
		Global.velocity(0)
	else:
		$Situacao.queue_free()
		$Personagem.position = Vector2(Global.posicaox,Global.posicaoy)
		
func _on_Situacao_body_entered(body):
	get_tree().change_scene("res://cenas/situacoes/Situação1.tscn")
	get_parent().remove_child($Situacao)

func _on_passar_pressed():
	n += 1 
	if n == 2:
		$Personagem/Camera2D/AnimationPlayer.play("mover")
		$Dialogo.hide()
		$Dialogo/Timer1.start()
	else:
		$Dialogo/texto.text = dialogo[n]
	
func _on_Timer_timeout():
	$Personagem/Camera2D/AnimationPlayer.play_backwards("mover")
	$Dialogo/Timer2.start()
	
	
func _on_Timer2_timeout():
	Global.velocity(300)
#	Global.controle_false()

func _on_transicao_timeout():
	$Transition.queue_free()
