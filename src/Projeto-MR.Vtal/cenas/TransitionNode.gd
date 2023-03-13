extends CanvasLayer

func timer():
	$Timer_transition.start() #inicia tempo para apagar quadrado da tela 
	
func _ready():
	pass 

func _on_Timer_timeout():
	queue_free() #quando termina o timer sai a tela utilizadando a função queue free 
