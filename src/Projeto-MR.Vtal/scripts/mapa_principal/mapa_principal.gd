extends Node2D

var dialogo = Global.falas["nathalia"]
var n = 0
var controle = Global.controle_nathalia

func _ready():
	$dialogo.hide()
	$CanvasLayer.hide()
	if controle == true:
		$hud.hide()
		$dialogo.hide()
		$Transition/Fill/animation.play_backwards("transicao")
		$Timer4.start()
	else:
		$Situacao.queue_free()
		$Personagem.position = Vector2(Global.posicaox,Global.posicaoy)
		
func _on_Situacao_body_entered(body):
	$CanvasLayer.show()
	esconder()
	$CanvasLayer/TransicaoCasa/ColorRect/AnimationPlayer.play("animacao")
	$Timer3.start()

func _on_passar_pressed():
	n += 1 
	if n == 2:
		$Personagem/Camera2D/AnimationPlayer.play("mover")
		$dialogo.hide()
		$dialogo/Dialogo/Timer1.start()
	else:
		$dialogo/Dialogo/texto.text = dialogo[n]
	
func _on_Timer_timeout():
	$Personagem/Camera2D/AnimationPlayer.play_backwards("mover")
	$dialogo/Dialogo/Timer2.start()
	
func _on_Timer2_timeout():
	Global.velocity(300)
	Global.controle_false()

func _on_transicao_timeout():
	$Transition.queue_free()

func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://casa_1_interno.tscn") # Replace with function body.

func esconder():
	$gamepad.hide()
	$hud.hide()

func _on_Timer3_timeout():
	get_tree().change_scene("res://cenas/situacoes/Situação1.tscn")
	
func _on_Timer4_timeout():
#	$Transition.queue_free()
	$hud.show()
	$dialogo/Dialogo/texto.text = dialogo[0]
	Global.velocity(0)
	$dialogo.show()
