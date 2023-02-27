extends Node2D

var n = 0
var dialogo = Global.falas['fabricio'] # chama o dicionario global contendo os dialogos e armazena em uma variavel local
#neste caso chama a seção do fabrício
func _ready():
	$texto.text = dialogo[n]
#ao iniciar define o texto com base no indice do dicionario
func _on_pular_pressed():
	if n == 5:
		Global.velocity()
		queue_free()
		get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn")#muda de cena após acabar o diálogo
		
	else:
		$texto.text = dialogo[n]  #muda o texto de acordo com a seção do dicionario definido nas variaveis globais
		n += 1
	
