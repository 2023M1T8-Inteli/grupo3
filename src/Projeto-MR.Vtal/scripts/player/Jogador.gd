extends KinematicBody2D

var pontuacao = Global.pontuacao
var screen_size #variável pra definir o tamanho da tela	
var control = true
var controle_tela = Global.controle_tela
var vel = Vector2.ZERO
var posicaox
var posicaoy
var up = false
var down = false
var right = false
var left = false

func _ready() -> void:
	screen_size = get_viewport_rect().size #define o tamanho da tela

func _physics_process(delta): #define os controles do jogo
	var speed = Global.speed
	if control == true: 
		vel = Vector2.ZERO  #define a velocidade como uma variável de vetor
		
		if Input.is_action_pressed('ui_up') or up:
			vel.y-= 1
		elif Input.is_action_just_released('ui_up') or up:
			$Animacao.play("paradoc")
			
		if Input.is_action_pressed("ui_left") or left:
			vel.x -= 1 
		elif Input.is_action_just_released("ui_left") or left:
			$Animacao.play("paradod")
			
		if Input.is_action_pressed("ui_right") or right:
			vel.x += 1
		elif Input.is_action_just_released("ui_right") or right:
			$Animacao.play("paradod")
			
		if Input.is_action_pressed("ui_down") or down:
			vel.y += 1
		elif Input.is_action_just_released("ui_down") or down:
			$Animacao.play("parado")
			
		if Input.is_action_pressed("ui_accept"):
			vel.y-= 1
			
		move_and_slide(vel.normalized() * speed, Vector2.ZERO) 
		
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
		
		if controle_tela == false:
			pass
#		else:
#			position.x = clamp(position.x, 0, screen_size.x) #Define o limite horizontal da tela
#			position.y = clamp(position.y, 0, screen_size.y) #Define o limite vertical da tela
		#Código comentado para poder instanciar o mapa principal diretamente sem definir a tela. Mas pro funcionamento do jogo, ele deve estar rodando

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

func _on_Situao1_body_entered(body):
	control = false
	$Animacao.stop()

func _on_Situao1_body_exited(body):
	queue_free()

func _on_Timer2_timeout():
	pass
		
func _on_up_pressed():
	up = true 

func _on_up_released():
	up = false 

func _on_down_pressed():
	down = true 

func _on_down_released():
	down = false 

func _on_right_pressed():
	right = true 

func _on_left_pressed():
	left = true

func _on_right_released():
	right = false 
	
func _on_left_released():
	left = false 

func _on_Area2D_body_entered(body):
	posicaox = position.x 
	posicaoy = position.y +10
	Global.atualizar_posicao(posicaox,posicaoy)
