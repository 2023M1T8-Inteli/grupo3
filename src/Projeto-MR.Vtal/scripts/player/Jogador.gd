extends Node2D

var speed = Global.speed

signal hit

var screen_size #variável pra definir o tamanho da tela	
var control = true
var controle_tela = Global.controle_tela

func _ready() -> void:
	screen_size = get_viewport_rect().size #Define o tamanho da tela
	$Colisao.position.x = 500
	$Colisao.position.y = 300

func _process(delta:float) -> void: #Define os controles do jogo
	if control == true:
		var velocity = Vector2.ZERO  #define a velocidade como uma variável de vetor
		if Input.is_action_pressed('ui_right'): #caso aperte o botão pra cima, soma 1 na velocidade horizontal
			velocity.x += 1
		if Input.is_action_pressed("ui_left"): #caso aperte o botão pra esquerda, subtrai 1 na velocidade horizontal
			velocity.x -= 1 
		if Input.is_action_pressed("ui_up"): #caso aperte o botão pra cima, subtrai 1 na velocidade vertical
			velocity.y -= 1
		if Input.is_action_pressed('ui_down'): #caso perte o botão pra baixo, soma 1 na velocidade vertical
			velocity.y += 1
		if velocity.length() > 0: #Aplica a animação do personagem ao andar
			velocity = velocity.normalized() * speed
			$Colisao/AnimatedSprite.play()
		else:
			$Colisao/AnimatedSprite.stop()
		#Configura as animações de acordo com a direção do personagem
		if velocity.x != 0: 
			$Colisao/AnimatedSprite.animation = 'direita'
			$Colisao/AnimatedSprite.flip_v = false
			$Colisao/AnimatedSprite.flip_h = velocity.x < 0
		elif velocity.y != 0:
			if velocity.y < 0: 	
				$Colisao/AnimatedSprite.animation = 'cima'
			elif velocity.y > 1:
				$Colisao/AnimatedSprite.animation = 'baixo'
				
		position += velocity * delta #Atualiza a posição de acordo com a movimentação
		if controle_tela == true:
			position.x = clamp(position.x, -500, screen_size.x - 500) #Define o limite horizontal da tela
			position.y = clamp(position.y, -300, screen_size.y - 300) #Define o limite vertical da tela

func _on_diamond_area_entered(area):
	speed = 0
	control = false
	emit_signal("hit")
	$Colisao/AnimatedSprite.stop()
