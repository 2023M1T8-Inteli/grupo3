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
	$corpocab.hide()
	$cabeca.hide()
	$inicial.hide()
	$sp1.hide()
	$spt.hide()
	$braco.hide()
	$ganhou.hide()
	$reiniciar.hide()
	$sair.hide()
	acertos = 0
	letras_ausentes = []
	erros = 0
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
			pass

func _on_sair_pressed():
	Global.pontuacao += 2
	Global.control_inneramb = true
	get_tree().change_scene("res://cenas/situacoes/situacao_2.tscn")

func _on_reiniciar_pressed():
	_ready()
	current_state = State.playing

func _on_TouchScreenButton_pressed():
	$clique_botao.hide()
	OS.show_virtual_keyboard("text")

func _on_letra_text_changed(new_text):
	if len(new_text) > 1:
		$letra.text = new_text[0]

func conferir_letra():
	match current_state:
		State.playing:
			letra.to_upper()
			if letra != '':
				if palavra.find(letra) != -1:
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

func _on_a2_pressed():
	letra = 'A'
	conferir_letra()

func _on_e_pressed():
	letra = 'E'
	conferir_letra()

func _on_d_pressed():
	letra = 'D'
	conferir_letra()

func _on_f_pressed():
	letra = 'F'
	conferir_letra()

func _on_b_pressed():
	letra = 'B'
	conferir_letra()

func _on_c2_pressed():
	letra = 'C'
	conferir_letra()

func _on_j_pressed():
	letra = 'J'
	conferir_letra()

func _on_l_pressed():
	letra = 'L'
	conferir_letra()

func _on_h_pressed():
	letra = 'H'
	conferir_letra()

func _on_t2_pressed():
	letra = 'T'
	conferir_letra()

func _on_u_pressed():
	letra = 'U'
	conferir_letra()

func _on_o_pressed():
	letra = 'O'
	conferir_letra()

func _on_k_pressed():
	letra = 'K'
	conferir_letra()

func _on_p_pressed():
	letra = 'P'
	conferir_letra()

func _on_h2_pressed():
	letra = 'H'
	conferir_letra()

func _on_i2_pressed():
	letra = 'I'
	conferir_letra()

func _on_g_pressed():
	letra = 'G'
	conferir_letra()

func _on_z_pressed():
	letra = 'Z'
	conferir_letra()

func _on_q_pressed():
	letra = 'Q'
	conferir_letra()

func _on_m_pressed():
	letra = 'M'
	conferir_letra()

func _on_x_pressed():
	letra = 'X'
	conferir_letra()

func _on_w_pressed():
	letra = 'W'
	conferir_letra()

func _on_s_pressed():
	letra = 'S'
	conferir_letra()

func _on_r_pressed():
	letra = 'R'
	conferir_letra()

func _on_v_pressed():
	letra = 'V'
	conferir_letra()

func _on_y_pressed():
	letra = 'Y'
	conferir_letra()

func _on_n_pressed():
	letra = 'N'
	conferir_letra()
