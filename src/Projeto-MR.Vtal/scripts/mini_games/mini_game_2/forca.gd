extends Node2D

var palavra = 'ETICA'
var letras_ausentes = []
var letra 
var erros
var acertos = 0
var current_state = State.playing

enum State {
	playing
	game_over
}

func _ready():
	$ganhou.hide()
	$reiniciar.hide()
	$sair.hide()
	acertos = 0
	letras_ausentes = []
	erros = 0
	$erros.text = ''
	$E.hide()
	$t.hide()
	$i.hide()
	$c.hide()
	$a.hide()
	palavra = 'ETICA'

func _process(_delta):
	if acertos == 5:
		$ganhou.show()
		$sair.show()

func _on_Button_pressed():
	match current_state:
		State.playing:
			letra = $letra.text.to_upper()
			if letra != '':
				$letra.text = ''
				if palavra.find(letra)!= -1:
					palavra = palavra.replace(letra, "")
					if letra =='E':
						$E.show()
						acertos += 1
					if letra =='T':
						$t.show()
						acertos += 1
					if letra =='I':
						$i.show()
						acertos += 1 
					if letra =='C':
						$c.show()
						acertos += 1
					if letra =='A':
						$a.show()
						acertos += 1

				else:
					letras_ausentes.append(letra)
					$erros.text = ''
					for i in letras_ausentes:
						$erros.text += '%s, ' % [str(i)] 
					if len(letras_ausentes) == 1:
						$cabeca.show()
					elif len(letras_ausentes) == 2:
						$corpocab.show()
					elif len(letras_ausentes) == 3:
						$braco.show()
					elif len(letras_ausentes) == 4:
						$spt.show()
					elif len(letras_ausentes) == 5:
						$sp1.show()
					elif len(letras_ausentes) == 6:
						$inicial.show()
					elif len(letras_ausentes) == 7:
						$fim.show()
						$reiniciar.show()
						$sair.show()
						current_state = State.game_over
		State.game_over:
			pass

func _on_sair_pressed():
	Global.pontuacao += 2
	get_tree().change_scene("res://cenas/situacoes/situacao_2.tscn")

func _on_reiniciar_pressed():
	_ready()
	current_state = State.playing
