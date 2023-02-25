extends Node2D

var falas_diamante = Global.falas['diamante'] #chama o dicionario global, na seç~´ao do diamante, contendo as falas do tutorial
var n = 1

func _ready():
	$dialogo.hide()
	$dialogo/diamante2.hide()

func _on_diamond_area_entered(area):
	$dialogo.show()
	$dialogo/diamante2.show()
	$dialogo/texto.text = falas_diamante[0]
#ao entrar no colisionshape do diamante ele  mostra o dialogo com o diamante(tutorial)
func _on_TextureButton_pressed():
	if n == 3:				 #se o índice do dicionario for 3 ele muda de cena, pois não há este indice nele
		get_tree().change_scene("res://cenas/DiálogoFabricio.tscn") 
	else:  					#ao clicar no botão ele atualiza o dialogo(passa para as proximas falas)
		$dialogo/texto.text = falas_diamante[n]
		n += 1
	
