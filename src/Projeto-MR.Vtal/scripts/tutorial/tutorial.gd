extends Node2D

var falas_diamante = Global.falas['diamante'] #chama o dicionario global, na seç~´ao do diamante, contendo as falas do tutorial
var n = 1

func _ready():
	$Transition2.hide()
	$dialogo.hide()
	$dialogo/diamante2.hide()
	$Transition/Fill/animation.play_backwards("transicao")
	$Transition.timer()

func _on_TextureButton_pressed():
	if n == 3:				 #se o índice do dicionario for 3 ele muda de cena, pois não há este indice nele
		$Transition2.show()
		$Transition2/Fill/animation.play("transicao")
		$Timer.start()
#		
	else:  					#ao clicar no botão ele atualiza o dialogo(passa para as proximas falas)
		$dialogo/texto.text = falas_diamante[n]
		n += 1
	
func _on_Diamante_body_entered(body):
	$dialogo.show()
	$dialogo/diamante2.show()
	$dialogo/texto.text = falas_diamante[0]
	
func _on_Timer_timeout():
	get_tree().change_scene("res://cenas/dialogo_fabricio/DiálogoFabricio.tscn") 
