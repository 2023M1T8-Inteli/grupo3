extends Node2D

var dialogo = Global.falas["nathalia"] #carrega falas da nathalia 
var n = Global.nthalia_index #controle de falas, indíce do dicionário 
var controle = Global.controle_nathalia #controla se está no diálogo da nathalia, dicionário nathalia 
var nivel_2 = Global.nivel_2#verifica se o player passou de nível para iniciar a cutscene 
var current_state = Global.current_state
var i = Global.call_index
var j = Global.cutscene_index
var obj_position

func _ready(): 
	$hud.show()
	$Blur/Blur.hide()
	Global.objective = true
	$Personagem/Arrow.show()
	Global.obj_position = $excl.get_position()
	Global.camera_state = Global.StateCameraClamp.Off
	$Personagem.position = Global.pos_map
	$dialogo.hide() #esconde dialogo e falas durante início da cena 
	$CanvasLayer.hide()
	
	match current_state: #primeira abertura do jogo inicia dialogo com nathalia  
		Global.State.Explore:
			$Personagem/Arrow.hide()
			Global.pontuacao = -1000
		Global.State.Inicio:
			
			Global.obj_position = $excl.get_position()
			Global.controle_nathalia = false
			$sec_mission.hide()
			$hud.hide()
			$Personagem/gamepad.show()
			$dialogo.hide()
			$Transition.show()
			$Transition/Fill/animation.play_backwards("transicao")
			$Timer4.start()
			$mini_game_1/poste.set_disabled(true)
	#		Global.nivel_1 = true
	#		Global.pontuacao = 0
	 #quando ele voltar da situação ele esconde a exclamação, atualiza a posição do personagem e apaga o dialogo inicial
		Global.State.Situacao1:
			Global.obj_position = $excl.get_position()
			$sec_mission.hide()
			$mini_game_1/poste.set_disabled(true)
			$Transition.show()
			$Transition/Fill/animation.play_backwards("transicao")
			
		Global.State.Situacao1_finish:
			Global.obj_position = $sec_mission.get_position()
			if i == 0:
				Global.call_index += 1
				$Situacao.queue_free()
				$excl.queue_free()
				$sec_mission.show()
				$Transition.show()
				$Transition/Fill/animation.play_backwards("transicao")
				$Quest.start()
				
			else:
				$Situacao.queue_free()
				$excl.queue_free()
				$sec_mission.show()
				$Transition.show()
				$Transition/Fill/animation.play_backwards("transicao")

		Global.State.Situacao2:
			$Situacao.queue_free()
			$Sprite.queue_free()
			Global.obj_position = $seta_2.get_position()
			$Transition.show()
			$Transition/Fill/animation.play_backwards("transicao")
			$mini_game_1.queue_free()
			$excl.queue_free()
			$sec_mission.play()
			
			
			$Transition.hide()

		Global.State.Situacao2_finish:
			Global.obj_position = $situation_2/bar.get_position()
			$Transition.show()
			$Transition/Fill/animation.play_backwards("transicao")
			$Sprite.queue_free()
			$Situacao.queue_free()
			$excl.queue_free()
			$mini_game_1.queue_free()
			$sec_mission.queue_free()
			
		Global.State.Situacao3:
			$excl.queue_free()
			$Situacao.queue_free()
			$Sprite.queue_free()
			$Sprite2.queue_free()
			Global.obj_position = $seta_clube.get_position()
			
		Global.State.Situacao3_finish:
			Global.obj_position = $seta_vtal.get_position()
			
	match Global.current_nivel:
				Global.state_nivel.N2:
					if j == 0 :
						$nivel_1.start()
						$mini_game_1.queue_free()
						$sec_mission.hide()
						Global.cutscene_index = 1
						
					else: 
						pass
						
				Global.state_nivel.N3:
					if j == 0 :
						$nivel_2.start()
						Global.cutscene_index = 1
						
					else: 
						pass
						
				Global.state_nivel.N4:
						if j == 0:
							$Transition.show()
							$Transition/Fill/animation.play_backwards("transicao")
							$Quest.start()
							Global.cutscene_index = 1

						else:
							 pass

	match Global.current_area:
		
			Global.state_areas.AREA_2:
				if j != 0:
					$excl.hide()
					$mini_game_1.queue_free()
					$Sprite.queue_free()
					$sec_mission.hide()
				else: 
					pass
					
			Global.state_areas.AREA_3:
				if j!=0:
					$excl.hide()
					$Sprite.queue_free()
					$Sprite2.queue_free()
					$sec_mission.hide()
				else:
					pass
					
			Global.state_areas.FINAL:
					$excl.hide()
					$Sprite.queue_free()
					$Sprite2.queue_free()
					$sec_mission.hide()
					$Mapa_detalhes/Colisoes/barreira.queue_free()

func _process(delta):
	current_state = Global.current_state
	
	if Global.controle_nathalia == true:
			$hud.show()
			$dialogo/Dialogo/texto.text = dialogo[Global.nthalia_index]
			Global.velocity(0)
			$dialogo.show()
			Global.controle_nathalia  = false

func _on_Situacao_body_entered(body): #inicia animação nathalia e começa o timer da cena 
	$CanvasLayer.show()
	esconder()
	$CanvasLayer/TransicaoCasa/ColorRect/AnimationPlayer.play("animacao")
	Global.pos_map = Vector2($Personagem.position.x, $Personagem.position.y)
#	Global.posicaox = $Personagem.position.x
#	Global.posicaoy = $Personagem.position.y
	$Timer3.start()

func _on_passar_pressed(): #carrega dialogo com natalia 
	n += 1 
	Global.nthalia_index = n
	
	if n == 2:
		$Personagem/Camera2D/AnimationPlayer.play("mover")
		$dialogo.hide()
		$dialogo/Dialogo/Timer1.start()
		
	elif n == 8:
		$dialogo.hide()
		$dialogo/Dialogo/Timer2.start()
		$Personagem/Camera2D/AnimationPlayer.play("bar_desbloq")
		$bar_desbloq.start()
		
	elif n == 10:
		Global.current_state = Global.State.Situacao3
		Global.obj_position = $seta_clube.get_position()
		$Personagem/Camera2D/AnimationPlayer.play("clube")
		$club.start()
		$dialogo.hide()
		
	elif n == 12:
		$Personagem/Camera2D/AnimationPlayer.play("final_1")
		$final.start()
		$dialogo.hide()
		Global.obj_position = $seta_vtal.get_position()
		
	elif n == 4:
		$dialogo.hide()
		$dialogo/Dialogo/Timer2.start()
	
	else:
		$dialogo/Dialogo/texto.text = dialogo[n]

func _on_Timer_timeout(): #fim do timer do dialogo e da cena 
	$Personagem/Camera2D/AnimationPlayer.play_backwards("mover")
	$dialogo/Dialogo/Timer2.start()

func _on_Timer2_timeout(): #personagem pode se mover dentro do mapa 
	Global.velocity(300)
	$Personagem/Arrow.show()

func _on_transicao_timeout(): #tira a transição da tela 
	$Transition.queue_free()

func _on_Area2D_body_entered(body): #personagem entra na casa e carrega a transição de entrada
	get_tree().change_scene("res://cenas/interiores/casa_1_interno.tscn") # Replace with function body.

func esconder(): #esconde a hud 
	$Personagem/gamepad.hide()
	$hud.hide()

func _on_Timer3_timeout(): #termina a situação 1 e muda de cena 
	get_tree().change_scene("res://cenas/situacoes/situacao_1.tscn")
	
func _on_Timer4_timeout(): #carrega a hud 
#	$Transition.queue_free()
	$hud.show()
	$dialogo/Dialogo/texto.text = dialogo[Global.nthalia_index]
	Global.velocity(0)
	$dialogo.show()
	Global.current_state = Global.State.Situacao1

func _on_nivel_1_timeout():#ao subir de nivel inicia uma cutscene para mostrar a area liberando
	Global.velocity(0)
	Global.obj_position = $seta_2.get_position()
	$Personagem.objetivo_pos = $seta_2.get_position()
	$Personagem/Camera2D/AnimationPlayer.play("area_desb")
	$area_desbloqueada.start()

func _on_area_desbloqueada_timeout(): # mostra os cones desaparecendo  e da queue free neles para que de para entrar na area
	$sumir.play("sumir")
	$Sprite/StaticBody2D.queue_free()
	$nivel_1_2.start()
	
func _on_nivel_12_timeout():# volta para a posição do personagem
	$Personagem/Camera2D/AnimationPlayer.play_backwards("area_desb")
	$Personagem.objetivo_pos = $situation_2/bar.get_position()
	$area_reverso.start() 
	$Personagem.show()
	$Sprite.queue_free()
	
func _on_area_reverso_timeout():# deixa a camera na posição do personagem
	$Personagem/Camera2D.position = Vector2(0,0)
	Global.velocity(300)
	Global.area_1_desbl = true
	$Quest.start()

func _on_sit_2_timeout():
	$Personagem/Camera2D/AnimationPlayer.play_backwards("mover_2")
	Global.velocity(300)
	$Quest.start()

func _on_mini_game_1_body_entered(body):
	get_tree().change_scene("res://cenas/mini_games/mini_game_1/flappy.tscn")

func _on_situation_2_body_entered(body):
	Global.posicaox = $Personagem.position.x
	Global.posicaoy = $Personagem.position.y
	get_tree().change_scene("res://cenas/situacoes/situacao_2.tscn")
	
func _on_bar_desbloq_timeout():
	$Personagem/Camera2D/AnimationPlayer.play_backwards("bar_desbloq")
	Global.speed = 250

func _on_nivel_2_timeout():
	Global.velocity(0)
	$Personagem.hide()
	$Personagem/Camera2D/AnimationPlayer.play("area_2")
	$area_desb_3.start()

func _on_area_desb_3_timeout():
	$sumir_3.play("sumir_2")
	$sumir_2_3.start()

func _on_sumir_2_timeout():
	$Personagem/Camera2D/AnimationPlayer.play_backwards("area_2")
	Global.speed = 250
	$Quest.start()

func _on_final_timeout():
	$Personagem/Camera2D/AnimationPlayer.play_backwards("final_1")
	Global.speed = 250
func _on_mercado2_body_entered(body):
	get_tree().change_scene("res://cenas/interiores/mercado.tscn")

func _on_clube2_body_entered(body):
	get_tree().change_scene("res://cenas/situacoes/situacao_3.tscn")

func _on_club_timeout():
	$Personagem/Camera2D/AnimationPlayer.play_backwards("clube")
	Global.speed = 250

func _on_vtal_body_entered(body):
		get_tree().change_scene("res://cenas/interiores/prédio_vtal.tscn")

func _on_sumir_2_3_timeout():
		$Personagem.show()
		$Sprite2.queue_free()
		Global.current_state = Global.State.Situacao3
		Global.current_area = Global.state_areas.AREA_3
		$sumir_2.start()

func _on_Node2D_blur_on():
	$Blur/Blur.show()

func _on_Node2D_blur_off():
	$Blur/Blur.hide()

func _on_casa_1_body_entered(body):
	get_tree().change_scene("res://cenas/interiores/casa_1.tscn")

func _on_restaurant_body_entered(body):
	get_tree().change_scene("res://cenas/interiores/restaurante.tscn")

func _on_casa_2_body_entered(body):
	get_tree().change_scene("res://cenas/interiores/casa_2.tscn")

func _on_casa_3_body_entered(body):
	get_tree().change_scene("res://cenas/interiores/casa_3.tscn")

func _on_Quest_timeout():
	$Quest.queue_free()
