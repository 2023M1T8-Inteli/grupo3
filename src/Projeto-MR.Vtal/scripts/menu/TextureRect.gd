extends Node

export(float) var scroll_speed = 0.03
var music_status = true
#faz com que a variavel seja acessivel em outros scripts, como por exemplo no controle da interface grafica da cena
# Called when the node enters the scene tree for the first time.
func _ready():
	self.material.set_shader_param( "scroll_speed", scroll_speed) 
#ao iniciar a cena,  define um parametro shader "scroll_speed" para este objeto, ou seja um parametro que controla a disposição de pixels na tela

func _on_TextureButton_pressed():
	get_tree().change_scene("res://cenas/tutorial/tutorial.tscn")
# ao pressionar o botão 1(play) troca para a tela de tutorial com o personagem principal

func _on_Volume_pressed(): #ao clicar no botão de volume a música para e ao clicar novamente ela volta e assim sucessivamente
	if music_status == true:
		$musica_fundo.stop()
		music_status = false
	else:
		$musica_fundo.play()
		music_status = true


func _on_sair_pressed():
	get_tree().quit()
