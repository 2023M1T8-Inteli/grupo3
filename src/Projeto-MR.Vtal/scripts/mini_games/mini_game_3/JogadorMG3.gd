extends Area2D

export var speed = 400 #velocidade com que o jogador se movimenta
var screen_size #definirá o tamanho da tela
var controle = true #variável criada para que a movimentação possa ser ativada ou desativada por meio dela
var up = false
var down = false
var right = false
var left = false

signal hit #sinal criado para quando o jogador colidir com um inimigo

func _ready(): 
	hide() #esconde o jogador, para que ele somente apareça ao se cliar no botão de iniciar 
	screen_size = get_viewport_rect().size #define o tamanho da tela
	
func _process(delta:float) -> void: #função que define a movimentação do jogador de acordo com o input 
	var velocity = Vector2.ZERO
	if controle: #se controle for verdadeiro, executa a movimentação
		if Input.is_action_pressed("ui_right") or right: 
			velocity.x += 1
		if Input.is_action_pressed("ui_left") or left:
			velocity.x -= 1
		if Input.is_action_pressed("ui_down") or down:
			velocity.y += 1 
		if Input.is_action_pressed("ui_up") or up:
			velocity.y -= 1  
		if velocity.length() > 0: #se alguma tecla estiver sendo pressionada, aplica a movimentação e a animação do jogador
			velocity = velocity.normalized() * speed
			$Animacao.play()
		else:
			$Animacao.stop()
			
		if velocity.x != 0: #regula a animação a ser usada de acordo com a direção do movimento do jogador
			$Animacao.animation = "direita"
			$Animacao.flip_v = false
			$Animacao.flip_h = velocity.x < 0 
		if velocity.y < 0:
			$Animacao.animation = "cima"
		if velocity.y > 0:
			$Animacao.animation = "baixo"
	
	#Define o limite da tela, de forma que o jogador não possa ultrapassá-la
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
func start(pos): #define a posição do player ao se iniciar o jogo
	position = pos
	show()
	$HitBox.disabled = false

func parar(): #desabilita a movimentação do jogador 
	$HitBox.disabled = true
	controle = false

func _on_jogadorMG3_body_entered(body):
	hide()
	emit_signal("hit")
	$HitBox.set_deferred("disabled", true)

func _on_up_pressed():
	up = true

func _on_up_released():
	up = false

func _on_down_pressed():
	down = true

func _on_down_released():
	down = false

func _on_left_pressed():
	left = true

func _on_left_released():
	left = false

func _on_right_pressed():
	right = true

func _on_right_released():
	right = false
