extends Node2D

var dialogo = Global.falas['situacao2'] #utiliando a variavel definida no script do global
var n = 0 #controle do diálogo
var timer = Timer.new() #tempo de transição
var controle_situation = false
onready var imagem = $atencao #carrega a imagem atenção 

func _ready(): 
	Global.objective = false
	$excl_mini_game.hide()
	$mini_game_2/CollisionShape2D.set_disabled(true)
	Global.camera_state = Global.StateCameraClamp.On
#	$Personagem.position = Global.posicao_bar
	
	$Personagem.animacao.animation = "cima"
	$CanvasLayer.comecar_reverso()
	$CanvasLayer.timer() #inicia o tempo e animação reversa acima 
	$dialogo/CaixaDialogo/conversa.text = dialogo[0]["text"] #carrega caixa de diálogo 
	$dialogo/CaixaDialogo/VBoxContainer/Escolha1.hide() #esconde escolhas e feedback enquanto aparece perguntas 
	$dialogo/CaixaDialogo/VBoxContainer/Escolha2.hide()
	$dialogo/CaixaDialogo/VBoxContainer/Escolha3.hide()
	$dialogo/CaixaDialogo/VBoxContainer/Escolha4.hide()
	$dialogo/CaixaDialogo.hide()
	$NPC.position = Vector2(0,0)
	$NPC/NPC.stop()
	$NPC.show()
	$atencao.hide()
	$parabens.hide()
	$Transition.hide()
	if Global.control_inneramb:
		$Personagem.position = Global.pos_interior
		Global.control_inneramb = false
	
	match Global.current_state:
		Global.State.Situacao2_finish:
			if Global.current_nivel != Global.state_nivel.N3:
				$mini_game_2/CollisionShape2D.set_disabled(false)
				$excl_mini_game.show()
				$banco.queue_free()
				$exclamacao.queue_free()
			else: 
				pass
			
	match Global.current_nivel:
		Global.state_nivel.N3:
			$banco.queue_free()
			$exclamacao.queue_free()
			$mini_game_2.queue_free()
			$excl_mini_game.queue_free()

func _on_Situao1_body_entered(body): #quando o jogador entra na área definida inicia a cena 
	$Timer.start()
	
func _on_Button_pressed(): #após a apresentação da pergunta as escolhas aparecem 
	n += 1 
	if n == 3:
		var escolhas = dialogo[n]
		$dialogo/CaixaDialogo/conversa.hide()
		$dialogo/CaixaDialogo/Button.hide()
		$dialogo/CaixaDialogo/nome.hide()
		$dialogo/CaixaDialogo/VBoxContainer/Escolha1.show()
		$dialogo/CaixaDialogo/VBoxContainer/Escolha2.show()
		$dialogo/CaixaDialogo/VBoxContainer/Escolha3.show()
		$dialogo/CaixaDialogo/VBoxContainer/Escolha4.show()
		$dialogo/CaixaDialogo/VBoxContainer/Escolha1.text = str(escolhas[1])
		$dialogo/CaixaDialogo/VBoxContainer/Escolha2.text = str(escolhas[2])
		$dialogo/CaixaDialogo/VBoxContainer/Escolha3.text = str(escolhas[3])
		$dialogo/CaixaDialogo/VBoxContainer/Escolha4.text = str(escolhas[4])
		
	elif n > 4 and n < 10:
		n = 9
		$dialogo/CaixaDialogo/conversa.text = dialogo[n]
	
	elif n >= 10:
		$dialogo/CaixaDialogo.hide()
		$NPC/NPC/AnimationPlayer.play("sit_2_volta")
		$sit_2_volta.start()
		
	else:
		$dialogo/CaixaDialogo/conversa.text = dialogo[n]["text"]
		$dialogo/CaixaDialogo/nome.text = dialogo[n]["nome"]

func _on_sit_2_volta_timeout():
	Global.speed = 250
	Global.current_state = Global.State.Situacao2_finish
	$excl_mini_game.show()
	$mini_game_2/CollisionShape2D.set_disabled(false)
	
func _on_Escolha1_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	n += 1
	dialogo = dialogo[n][1]
	Global.pontuacao += 2
	Global.feedback_final['situ_2'][1] = $dialogo/CaixaDialogo/VBoxContainer/Escolha1.text
	Global.feedback_final['situ_2'][2] = dialogo
	Global.feedback_final['situ_2'][3] = 2
	clear() 
	$dialogo/CaixaDialogo.hide()
	$parabens.visible = true
	$parabens/feedback.text = dialogo
	n = 5
	
func _on_Escolha2_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	n += 1
	dialogo = dialogo[n][2]
	Global.pontuacao += 2
	Global.feedback_final['situ_2'][1] = $dialogo/CaixaDialogo/VBoxContainer/Escolha2.text
	Global.feedback_final['situ_2'][2] = dialogo
	Global.feedback_final['situ_2'][3] = 2
	clear()
	$dialogo/CaixaDialogo.hide()
	$parabens.show()
	$parabens/feedback.text = dialogo
	n = 6
	
func _on_Escolha3_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	n += 1
	dialogo = dialogo[n][3]
	Global.pontuacao += 0
	Global.feedback_final['situ_2'][1] = $dialogo/CaixaDialogo/VBoxContainer/Escolha3.text
	Global.feedback_final['situ_2'][2] = dialogo
	Global.feedback_final['situ_2'][3] = 0
	clear()
	$dialogo/CaixaDialogo.hide()
	$atencao.show()
	$atencao/feedback.text = dialogo
	n = 7
	
func _on_Escolha4_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	n += 1
	dialogo = dialogo[n][4]
	Global.pontuacao += -1
	Global.feedback_final['situ_2'][1] = $dialogo/CaixaDialogo/VBoxContainer/Escolha4.text
	Global.feedback_final['situ_2'][2] = dialogo
	Global.feedback_final['situ_2'][3] = 1
	
	clear()
	$dialogo/CaixaDialogo.hide()
	$atencao.show()
	$atencao/feedback.text = dialogo #controle de ordem de fala de acordo com o dicionário global 
	n = 8
	
func clear(): #encerra a cena 
	$dialogo/CaixaDialogo/VBoxContainer/Escolha1.queue_free()
	$dialogo/CaixaDialogo/VBoxContainer/Escolha2.queue_free()
	$dialogo/CaixaDialogo/VBoxContainer/Escolha3.queue_free()
	$dialogo/CaixaDialogo/VBoxContainer/Escolha4.queue_free()
	$dialogo/CaixaDialogo/Button.show()
	$dialogo/CaixaDialogo/nome.show()
	
func _on_passar_pressed(): #volta o personagem para o mapa 
	$atencao.hide()
	$parabens.hide()
	dialogo = Global.falas['situacao2']
	$dialogo/CaixaDialogo.show()
	$dialogo/CaixaDialogo/conversa.show()
	$dialogo/CaixaDialogo/conversa.text = dialogo[n]
	
func _on_banco_body_entered(body):
	$Transition.show()
	$Transition.comecar()
	$transicaoTimer.start()
	Global.speed = 0
	$exclamacao.queue_free()
	
func _on_transicaoTimer_timeout():
	$Transition.comecar_reverso()
	$Timer.start()

func _on_Timer_timeout(): #carrega caixa de diálogo
	$Transition.queue_free()
	$Timer.queue_free()
	$NPC.show()
	$banco.queue_free()
	$NPC/NPC/AnimationPlayer.play("sit_2_ida")
	$animacao_player.start()
	
func _on_animacao_player_timeout():
	$dialogo/CaixaDialogo.show()

func _on_saida_body_entered(body):
	get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn") 

func _on_npc_timeout():
	$NPC/NPC/AnimationPlayer.play("sit_2")
	$enemy.start()

func _on_enemy_timeout():
	$dialogo/CaixaDialogo.show()
	$dialogo/CaixaDialogo/conversa.text = dialogo[n]

func _on_mini_game_2_body_entered(body):
	Global.pos_interior = Vector2($Personagem.position.x +30,$Personagem.position.y +30)
	get_tree().change_scene("res://cenas/mini_games/mini_game_2/forca.tscn")
