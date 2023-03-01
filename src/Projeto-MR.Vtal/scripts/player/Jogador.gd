extends KinematicBody2D

var speed = Global.speed

signal hit

var screen_size #variável pra definir o tamanho da tela	
var control = true
var controle_tela = Global.controle_tela
var vidas = 100
var tesouro = 0 
var interactDist = 80 
var vel = Vector2.ZERO
var facingDir = Vector2()
onready var raycast = $RayCast2D

func _ready() -> void:
	screen_size = get_viewport_rect().size #Define o tamanho da tela
#	$Colisao.position.x = 500
#	$Colisao.position.y = 300

func _physics_process(delta): #Define os controles do jogo
	if control == true:
		var velocity = Vector2.ZERO  #define a velocidade como uma variável de vetor
		vel = Vector2.ZERO
		if Input.is_action_pressed('ui_up'):
			vel.y-= 1
			facingDir = Vector2(0,-1)
		if Input.is_action_pressed("ui_down"):
			vel.y += 1
			facingDir = Vector2(0,1)
		if Input.is_action_pressed("ui_left"):
			vel.x -= 1 
			facingDir = Vector2(-1,0)
		if Input.is_action_pressed("ui_right"):
			vel.x += 1
			facingDir = Vector2(1,0)
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
	if controle_tela == true:
		position.x = clamp(position.x, 0, screen_size.x) #Define o limite horizontal da tela
		position.y = clamp(position.y, 0, screen_size.y) #Define o limite vertical da tela
		
func _on_Diamante_body_entered(body):
	speed = 0
	control = false
	$Animacao.stop()
	controle_tela == false

func _on_Situao1_body_entered(body):
	control = false
	$Animacao.stop()
