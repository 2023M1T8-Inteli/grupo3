extends Area2D

var pontuacao = Global.pontuacao
var dialogo = Global.falas['situacao1']
var n = 1
var timer = Timer.new()
onready var imagem = $parabens
func _ready():
	$CaixaDialogo/nome.text = dialogo.nome
	$CaixaDialogo/conversa.text = dialogo[0]
	$CaixaDialogo/VBoxContainer/Escolha1.hide()
	$CaixaDialogo/VBoxContainer/Escolha2.hide()
	$CaixaDialogo/VBoxContainer/Escolha3.hide()
	$CaixaDialogo/VBoxContainer/Escolha4.hide()
	$CaixaDialogo.hide()
	$NPC.hide()
	$parabens.hide()
#	$atencao.hide()

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
		$CaixaDialogo/VBoxContainer/Escolha1.show()
		$CaixaDialogo/VBoxContainer/Escolha2.show()
		$CaixaDialogo/VBoxContainer/Escolha3.show()
		$CaixaDialogo/VBoxContainer/Escolha4.show()
#	elif n == 4:
#		Global.controle_false()
#		get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn")
	else:
		$CaixaDialogo/conversa.text = dialogo[n]
		n += 1 
	
func _on_Escolha1_pressed():
	dialogo = dialogo[n][1]
	pontuacao += 2
	Global.atualizar_pontuacao(pontuacao)
	clear() 
	$CaixaDialogo.queue_free()
	$parabens.visible = true
	imagem.texture = load(dialogo.feedback)
	$parabens/feedback.text = dialogo.text
	n += 1
	
func _on_Escolha2_pressed():
	dialogo = dialogo[n][2]
	pontuacao += 3
	Global.atualizar_pontuacao(pontuacao)
	clear()
	$CaixaDialogo.queue_free()
	imagem.texture = load(dialogo.feedback)
	$parabens.show()
	$parabens/feedback.text = dialogo.text
	n += 1
	
func _on_Escolha3_pressed():
	dialogo = dialogo[n][3]
	pontuacao += 0
	Global.atualizar_pontuacao(pontuacao)
	clear()
	$CaixaDialogo.queue_free()
	$parabens.show()
	imagem.texture = load(dialogo.feedback)
	
	$parabens/feedback.text = dialogo.text
	n += 1
	
func _on_Escolha4_pressed():
	dialogo = dialogo[n][4]
	pontuacao += -1
	Global.atualizar_pontuacao(pontuacao)
	clear()
	$CaixaDialogo.queue_free()
	imagem.texture = load(dialogo.feedback)
	$parabens.show()
	$parabens/feedback.text = dialogo.text
	n += 1
	
func clear():
	$CaixaDialogo/VBoxContainer/Escolha1.queue_free()
	$CaixaDialogo/VBoxContainer/Escolha2.queue_free()
	$CaixaDialogo/VBoxContainer/Escolha3.queue_free()
	$CaixaDialogo/VBoxContainer/Escolha4.queue_free()
	$CaixaDialogo/Button.show()
	


func _on_passar_pressed():
	Global.controle_false()
	get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn") # Replace with function body.
