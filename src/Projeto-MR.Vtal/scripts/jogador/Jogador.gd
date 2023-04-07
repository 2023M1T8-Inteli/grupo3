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
onready var animacao = get_node("Animacao_defensor")
onready var arrow = get_node("Arrow")
var arrow_pos = Vector2(0,0)
var objetivo_pos = Vector2(0,0)

func _ready() -> void:
	screen_size = get_viewport_rect().size #define o tamanho da tela
	print(Global.mobile)
	if Global.mobile == true:
		$gamepad.show()
	elif Global.mobile == false:
		$gamepad.hide()
	match Global.current_nivel:
		
		Global.state_nivel.N3:
			Global.current_state_skin =  Global.State_skin.General
			
		Global.state_nivel.N4:
			Global.current_state_skin = Global.State_skin.Rei
			
	match Global.current_state_skin:
		Global.State_skin.Defensor:
			animacao = get_node("Animacao_defensor")
			$Animacao_general.queue_free()
			$Animacao_rei.queue_free()
		Global.State_skin.General:
			animacao = get_node("Animacao_general")
			$Animacao_defensor.queue_free()
			$Animacao_rei.queue_free()
		Global.State_skin.Rei:
			animacao = get_node("Animacao_rei")
			$Animacao_defensor.queue_free()
			$Animacao_general.queue_free()
	

func _physics_process(delta): #define os controles do jogo
	if Global.objective:
		arrow_pos = arrow.get_global_position()
		objetivo_pos = Global.obj_position
		arrow.set_rotation((arrow_pos - objetivo_pos).angle())
	else:
		$Arrow.hide()
	var camera_state = Global.camera_state
	var speed = Global.speed
	if control == true: 
		vel = Vector2.ZERO  #define a velocidade como uma variável de vetor
		
		if Input.is_action_pressed('ui_up') or up:
			vel.y-= 1
		elif Input.is_action_just_released('ui_up') or up:
			animacao.play("paradoc")
			
		if Input.is_action_pressed("ui_left") or left:
			vel.x -= 1 
		elif Input.is_action_just_released("ui_left") or left:
			animacao.play("paradod")
			
		if Input.is_action_pressed("ui_right") or right:
			vel.x += 1
		elif Input.is_action_just_released("ui_right") or right:
			animacao.play("paradod")
			
		if Input.is_action_pressed("ui_down") or down:
			vel.y += 1
		elif Input.is_action_just_released("ui_down") or down:
			animacao.play("parado")
			
		if Input.is_action_pressed("ui_accept"):
			vel.y-= 1
			print()
			
		move_and_slide(vel.normalized() * speed, Vector2.ZERO) 
		
		if vel.x != 0: 
			animacao.play()
			animacao.animation = 'direita'
			animacao.flip_v = false
			animacao.flip_h = vel.x < 0
			
		elif vel.y != 0:
			animacao.play()
			if vel.y < 0: 	
				animacao.animation = 'cima'
			elif vel.y == 1:
				animacao.animation = 'baixo'
		else:
			animacao.stop()
		
		match camera_state:
			Global.StateCameraClamp.On:
				position.x = clamp(position.x, 0, screen_size.x) #Define o limite horizontal da tela
				position.y = clamp(position.y, 0, screen_size.y) #Define o limite vertical da tela
			Global.StateCameraClamp.Off:
				pass

func _on_Diamante_body_entered(body):
	Global.velocity(0)
	control = false
	animacao.stop()
	Global.tela()
	
func _on_Situacao_body_entered(body):
	posicaox = position.x 
	posicaoy = position.y
	Global.atualizar_posicao(posicaox,posicaoy)
	control = false
	animacao.stop()

func _on_Situao1_body_entered(body):
	control = false
	animacao.stop()

func _on_Situao1_body_exited(body):
	queue_free()

func _on_Timer2_timeout():
	pass
		
func _on_up_pressed():
	if control:
		up = true 

func _on_up_released():
	if control:
		up = false 

func _on_down_pressed():
	if control:
		down = true 

func _on_down_released():
	if control:
		down = false 

func _on_right_pressed():
	if control:
		right = true 

func _on_left_pressed():
	if control:
		left = true

func _on_right_released():
	if control:
		right = false 
	
func _on_left_released():
	if control:
		left = false 

func _on_Area2D_body_entered(body):
	control = false
	Global.pos_map = Vector2(position.x , position.y +10)
#	posicaox = position.x 
#	posicaoy = position.y +10
#	Global.atualizar_posicao(posicaox,posicaoy)

func _on_situation_2_body_entered(body):
	control = false
	Global.pos_map = Vector2(position.x , position.y +10)
#	posicaox = position.x 
#	posicaoy = position.y +10
#	Global.atualizar_posicao(posicaox,posicaoy)

func _on_mini_game_1_body_entered(body):
	control = false
	Global.pos_map = Vector2(position.x + 30, position.y +30)
#	posicaox = position.x +30
#	posicaoy = position.y +30
#	Global.atualizar_posicao(posicaox,posicaoy)


func _on_clube2_body_entered(body):
	control = false
	Global.pos_map = Vector2(position.x , position.y +30)
#	posicaox = position.x 
#	posicaoy = position.y +30
#	Global.atualizar_posicao(posicaox,posicaoy)


#func _on_saida_body_entered(body):
#	control = false
#	posicaox = position.x 
#	posicaoy = position.y - 30
#	Global.atualizar_posicao(posicaox,posicaoy)

func _on_vtal_body_entered(body):
	control = false
	Global.pos_map = Vector2(position.x , position.y +30)
#	posicaox = position.x 
#	posicaoy = position.y +30
#	Global.atualizar_posicao(posicaox,posicaoy)

func _on_hide_gamepad_timeout():
	$gamepad.hide()

func _on_show_gamepad_timeout():
	$gamepad.show()

func _on_Node2D_blur_on():
	$gamepad.hide()

func _on_Node2D_blur_off():
	$gamepad.show()

func _on_mini_game_2_body_entered(body):
	control = false
	posicaox = position.x 
	posicaoy = position.y +30
	Global.atualizar_posicao(posicaox,posicaoy)

func _on_Node2D_mov_off():
	control = false
	print('move_off')

func _on_Node2D_mov_on():
	control = true
	print('move_on')



func _on_mercado2_body_entered(body):
	Global.pos_map = Vector2(position.x , position.y +30)


func _on_casa_1_body_entered(body):
	Global.pos_map = Vector2(position.x , position.y +30)


func _on_restaurant_body_entered(body):
	Global.pos_map = Vector2(position.x , position.y +30)


func _on_casa_2_body_entered(body):
	Global.pos_map = Vector2(position.x , position.y +30)


func _on_casa_3_body_entered(body):
	Global.pos_map = Vector2(position.x , position.y +30)
