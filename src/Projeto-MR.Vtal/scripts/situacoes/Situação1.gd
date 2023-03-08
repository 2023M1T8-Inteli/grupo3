extends Area2D

var pontuacao = Global.pontuacao
var dialogo = Global.falas['situacao1']
var n = 1
var timer = Timer.new()

func _ready():
	$CaixaDialogo/conversa.text = dialogo[0]
	$CaixaDialogo/Escolha1.hide()
	$CaixaDialogo/Escolha2.hide()
	$CaixaDialogo/Escolha3.hide()
	$CaixaDialogo/Escolha4.hide()
	$CaixaDialogo.hide()
	$NPC.hide()
	$parabens.hide()
	$atencao.hide()

func _on_Situao1_body_entered(body):
	$NPC.show()
	$NPC/AnimationPlayer.play("Situacao1")
	$Timer.start()

func _on_Timer_timeout():
	$Timer.queue_free()
	$CaixaDialogo.show()
	$NPC.animation = "esquerda"[0]
	$NPC.stop()
	
func _on_Button_pressed():
	if n == 3:
		$CaixaDialogo/conversa.hide()
		$CaixaDialogo/Button.hide()
		$CaixaDialogo/Escolha1.show()
		$CaixaDialogo/Escolha2.show()
		$CaixaDialogo/Escolha3.show()
		$CaixaDialogo/Escolha4.show()
	elif n == 4:
		Global.controle_false()
		get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn")
	else:
		$CaixaDialogo/conversa.text = dialogo[n]
		n += 1 
	
func _on_Escolha1_pressed():
	pontuacao += 2
	Global.atualizar_pontuacao(pontuacao)
	clear() 
	$parabens.show()
	$CaixaDialogo/conversa2.text = dialogo[n][1]
	n += 1
	
func _on_Escolha2_pressed():
	pontuacao += 1
	Global.atualizar_pontuacao(pontuacao)
	clear()
	$parabens.show()
	$CaixaDialogo/conversa2.text = dialogo[n][2]
	n += 1
	
func _on_Escolha3_pressed():
	pontuacao += 0
	Global.atualizar_pontuacao(pontuacao)
	clear()
	$atencao.show()
	$CaixaDialogo/conversa2.text = dialogo[n][3]
	n += 1
	
func _on_Escolha4_pressed():
	pontuacao += -1
	Global.atualizar_pontuacao(pontuacao)
	clear()
	$atencao.show()
	$CaixaDialogo/conversa2.text = dialogo[n][4]
	n += 1
	
func clear():
	$CaixaDialogo/Escolha1.queue_free()
	$CaixaDialogo/Escolha2.queue_free()
	$CaixaDialogo/Escolha3.queue_free()
	$CaixaDialogo/Escolha4.queue_free()
	$CaixaDialogo/Button.show()
	
