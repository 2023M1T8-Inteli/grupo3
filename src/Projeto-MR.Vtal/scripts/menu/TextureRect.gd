extends Node2D

export(float) var scroll_speed = 0.03
var music_status = true

onready var teste = "teste"

var n = 2

#faz com que a variavel seja acessivel em outros scripts, como por exemplo no controle da interface grafica da cena

func _ready():
	$checkMark.hide()
	$background/musica_fundo.play()
#ao iniciar a cena,  define um parametro shader "scroll_speed" para este objeto, ou seja um parametro que controla a disposição de pixels na tela

func _on_TextureButton_pressed():
	$background/clique_botao.play()
	$background/Timer.start()
# ao pressionar o botão 1(play) troca para a tela de tutorial com o personagem principal

func _on_Volume_pressed(): #ao clicar no botão de volume a música para e ao clicar novamente ela volta e assim sucessivamente
	$background/clique_botao.play()
	if music_status == true:
		$background/musica_fundo.stream_paused = true
		$background/Volume.texture_normal = load("res://imagens/menu/imagem (18).png")

		music_status = false
	else:
		$background/musica_fundo.stream_paused = false
		$background/Volume.texture_normal = load("res://imagens/menu/imagem (17).png")
		music_status = true

func _on_Timer_timeout():
	$AnimationPlayer.play("confirm")
	$Label3.hide()
	$VBoxContainer.hide()
	$CheckBox.hide()
	$checkMark.hide()
	$background/Volume.hide()
	$Label3.hide()
	$VBoxContainer.hide()
	$AnimationPlayer.play("confirm")


func _on_sair_pressed():
	get_tree().quit()

func _on_CheckBox_pressed():
	if n % 2 == 0:
		$checkMark.show()
		n += 1
	else:
		$checkMark.hide()
		n += 1
	if OS.window_fullscreen:
		OS.window_fullscreen = !OS.window_fullscreen
	else: OS.window_fullscreen = true

func _on_mobile_pressed():
	Global.mobile = true

	get_tree().change_scene_to(load("res://cenas/tutorial/Tutorial.tscn"))
#
#
#




func _on_desktop_pressed():
	Global.mobile = false
	get_tree().change_scene("res://cenas/tutorial/Tutorial.tscn")
