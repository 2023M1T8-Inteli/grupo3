extends RigidBody2D

var min_speed = 150 #velocidade mínima do inimigo
var max_speed = 300 #velocidade máxima do inimigo

func _ready() -> void: #randomiza a animação do inimigo a ser utilizada, escolhendo entre nadando, andando ou voando
	var tipo_inimigos = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = tipo_inimigos[randi() % tipo_inimigos.size()]

func _on_VisibilityNotifier2D_screen_exited(): #deleta o inimigo ao sair da tela, para não travar o jogo
	queue_free()
