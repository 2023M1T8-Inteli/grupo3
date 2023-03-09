extends Node2D

var dialogo = Global.falas["nathalia"] #carrega falas da nathalia 
var n = 0 #controle de falas, indíce do dicionário 
var controle = Global.controle_nathalia #controla se está no diálogo da nathalia, dicionário nathalia 
var nivel_1 = Global.nivel_1
var nivel_2 = Global.nivel_2
var nivel_3 = Global.nivel_3
var nivel_4 = Global.nivel_4
var nivel_5 = Global.nivel_5

func _process(delta):
	if Global.pontuacao == 2:
		Global.nivel_2 = true
		
		$nivel_1.start()
		
func _ready(): 
	$dialogo.hide() #esconde dialogo e falas durante início da cena 
	$CanvasLayer.hide()
	if controle == true: #primeira abertura do jogo inicia dialogo com nathalia  
		$hud.hide()
		$dialogo.hide()
		$Transition/Fill/animation.play_backwards("transicao")
		$Timer4.start()
		Global.nivel_1 = true
		Global.pontuacao = 0
	else:
		$Situacao.queue_free() #após dialogo o personagem fica na posição inicial 
		$Personagem.position = Vector2(Global.posicaox,Global.posicaoy) 
		$excl.hide()
func _on_Situacao_body_entered(body): #inicia animação nathalia e começa o timer da cena 
	$CanvasLayer.show()
	esconder()
	$CanvasLayer/TransicaoCasa/ColorRect/AnimationPlayer.play("animacao")
	$Timer3.start()

func _on_passar_pressed(): #carrega dialogo com natalia 
	n += 1 
	if n == 2:
		$Personagem/Camera2D/AnimationPlayer.play("mover")
		$dialogo.hide()
		$dialogo/Dialogo/Timer1.start()
	else:
		$dialogo/Dialogo/texto.text = dialogo[n]
	
func _on_Timer_timeout(): #fim do timer do dialogo e da cena 
	$Personagem/Camera2D/AnimationPlayer.play_backwards("mover")
	$dialogo/Dialogo/Timer2.start()
	
func _on_Timer2_timeout(): #personagem pode se mover dentro do mapa 
	Global.velocity(300)
	Global.controle_false()

func _on_transicao_timeout(): #tira a transição da tela 
	$Transition.queue_free()

func _on_Area2D_body_entered(body): #personagem entra na casa e carrega a transição de entrada
	get_tree().change_scene("res://casa_1_interno.tscn") # Replace with function body.

func esconder(): #esconde a hud 
	$gamepad.hide()
	$hud.hide()

func _on_Timer3_timeout(): #termina a situação 1 e muda de cena 
	get_tree().change_scene("res://cenas/situacoes/Situação1.tscn")
	
func _on_Timer4_timeout(): #carrega a hud 
#	$Transition.queue_free()
	$hud.show()
	$dialogo/Dialogo/texto.text = dialogo[0]
	Global.velocity(0)
	$dialogo.show()


func _on_nivel_1_timeout():
	Global.pontuacao = 0
