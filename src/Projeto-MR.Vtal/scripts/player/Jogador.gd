extends KinematicBody2D

#var speed = Global.speed
var pontuacao = Global.pontuacao
var screen_size #variável pra definir o tamanho da tela	
var control = true
var controle_tela = Global.controle_tela
var vel = Vector2.ZERO
var posicaox
var posicaoy

func _ready() -> void:
	screen_size = get_viewport_rect().size #Define o tamanho da tela

func _physics_process(delta): #Define os controles do jogo
	var speed = Global.speed
	if control == true:
		var velocity = Vector2.ZERO  #define a velocidade como uma variável de vetor
		vel = Vector2.ZERO
		if Input.is_action_pressed('ui_up'):
			vel.y-= 1
		if Input.is_action_pressed("ui_down"):
			vel.y += 1
		if Input.is_action_pressed("ui_left"):
			vel.x -= 1 
		if Input.is_action_pressed("ui_right"):
			vel.x += 1
		if Input.is_action_pressed("ui_accept"):
			print(pontuacao)
		move_and_slide(vel * speed, Vector2.ZERO)
		if vel.x != 0: 
			$Animacao.play()
			$Animacao.animation = 'direita'
			$Animacao.flip_v = false
			$Animacao.flip_h = vel.x < 0
		elif vel.y != 0:
			$Animacao.play()
			if vel.y < 0: 	
				$Animacao.animation = 'cima'
			elif vel.y == 1:
				$Animacao.animation = 'baixo'
		else:
			$Animacao.stop()
#		if controle_tela == false:
#			pass
#		else:
#			position.x = clamp(position.x, 0, screen_size.x) #Define o limite horizontal da tela
#			position.y = clamp(position.y, 0, screen_size.y) #Define o limite vertical da tela
		
func _on_Diamante_body_entered(body):
	Global.velocity(0)
	control = false
	$Animacao.stop()
	Global.tela()
	
func _on_Situacao_body_entered(body):
	posicaox = position.x 
	posicaoy = position.y
	Global.atualizar_posicao(posicaox,posicaoy)
	control = false
	$Animacao.stop()
	get_tree().change_scene("res://cenas/situacoes/Situação1.tscn")

func _on_Situao1_body_entered(body):
	control = false
	$Animacao.stop()

func _on_Situao1_body_exited(body):
#	var posicaox = float(Global.posicaox)
#	var posicaoy = float(Global.posicaoy)
	queue_free()

func _on_Timer2_timeout():
	pass
		
