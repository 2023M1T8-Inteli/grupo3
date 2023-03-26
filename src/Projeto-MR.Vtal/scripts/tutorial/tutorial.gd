extends Node2D

var falasDiamante = Global.falas['diamante'] #chama o dicionario global, na seç~´ao do diamante, contendo as falas do tutorial
var n = 1
var limite = len(falasDiamante) 

func _ready(): #Esconde a HUD da tela, parap oder tocar a transição entre as cenas
	$gamepad.hide()
	$Transition2.hide()
	$dialogo.hide()
	$dialogo/diamante2.hide()
	$Transition/Fill/animation.play_backwards("transicao")
	$Transition.timer()
	$dialogo.show()
	$dialogo/diamante2.show()
	$dialogo/texto.text = falasDiamante[0]

func _on_TextureButton_pressed(): 
	if n == limite: #se o índice do dicionario for 3 ele muda de cena, já que representa o fim do diálogo
		$dialogo.queue_free()
		$gamepad.show()
	else:  #ao clicar no botão ele atualiza o dialogo (passa para as proximas falas)
		$dialogo/texto.text = falasDiamante[n]
		n += 1

func _on_Diamante_body_entered(body): #Começa a mudança de cena ao colidir com o diamante
	$Timer.start() #inicia o timer, para que a transição seja tocada antes de se trocar de cena 
	$Transition2.show()
	$Transition2/Fill/animation.play("transicao")

func _on_Timer_timeout(): 
	get_tree().change_scene("res://cenas/dialogo_fabricio/dialogo_fabricio.tscn") 
