extends Node2D
onready var nivel_imag = $VBoxContainer/nivel

func _process(delta):
	if Global.pontuacao == 1:
		nivel_imag.texture = load("res://imagens/hud/pixil-frame-0 (8).png")
	elif Global.pontuacao == 2:
		nivel_imag.texture = load("res://imagens/hud/pixil-frame-0 (6).png")
	elif Global.pontuacao == 3:
		nivel_imag.texture = load("res://imagens/hud/pixil-frame-0 (7).png")
	elif Global.pontuacao == 4:
		nivel_imag.texture = load("res://imagens/hud/pixil-frame-0 (8).png")
