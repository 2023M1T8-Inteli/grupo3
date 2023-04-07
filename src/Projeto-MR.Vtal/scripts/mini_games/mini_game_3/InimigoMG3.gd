extends RigidBody2D

var min_speed = 150 #velocidade mínima do inimigo
var max_speed = 300 #velocidade máxima do inimigo

func _ready() -> void: #randomiza a animação do inimigo a ser utilizada, escolhendo entre nadando, andando ou voando
	pass

func _on_VisibilityNotifier2D_screen_exited(): #deleta o inimigo ao sair da tela, para não travar o jogo
	queue_free()
