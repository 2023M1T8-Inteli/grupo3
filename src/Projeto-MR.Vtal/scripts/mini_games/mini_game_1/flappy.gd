extends Node2D

export (PackedScene) var Barreira
var status = 0
var score = 0
var y = 2.5
var x = 2
var meta = 10
var current_state = State.first_time

enum State {
	first_time
	second_time
}

func _ready():
	$TouchScreenButton.hide()
	$clique_botao.hide()
	$sair.hide()
	$reiniciar.hide()
	$game_over.show()
	$passou.hide()

func iniciar_jogo():
	$clique_botao.hide()
	status = 1
	$game_over.hide()
	$spawnBarreira.start()
	$reiniciar.hide()
	$passou.hide()
	$sair.hide()
	$ferramenta.position = Vector2(-23,300)

func _process(delta):
	if status == 1:
		$background.position.x -= 1*x    
		if ($background.position.x) < -100:
			$background.position.x = 1048
		$columns.position.x -= 2*x           
		if ($columns.position.x) < -300:
			$columns.position.x = rand_range(200, 600) - 50
			$columns.position.y = rand_range(0, 400) - 200
		$ferramenta.position.y += y

		if $ferramenta.position.y > 600:
			$ferramenta.position.y = 480
			status = 0

		if $ferramenta.position.y < -20:
			$ferramenta.position.y = -20

		if Input.is_action_pressed("ui_up"):
			$ferramenta.position.y -= 8

		if score == meta:
			$passou.show()
			status = 0
			$spawnBarreira.queue_free()
			$sair.show()
			#código que adiciona pontos globais         adicionar

func _on_game_over_pressed():
	$clique_botao.show()
	$game_over.hide()
	$TouchScreenButton.show()
	
	

#func _on_columns_body_shape_entered(body_id, body, body_shape, local_shape):
#	if (local_shape < 2): #esse node tem 3 shapes de colisão: 0 e 1 são as colunas
#		status = 0 #muda o status para "parado"
#		$reiniciar.show()
#		if score >= 5:
#			$sair_ganho.show()

#executa essa função quando o dragão atravessa entre as colunas
#func _on_columns_body_shape_exited(body_id, body, body_shape, local_shape):
#	if (local_shape == 2): #esse node tem 3 shapes de colisão: 0 e 1 são as colunas
#		score += 1 #aumenta o score
#		print(score)
#		$score.text = ("Score: %d" % [score]) #atualiza o painel

func _on_reiniciar_pressed():
	iniciar_jogo()

func _on_sair_pressed():
	Global.pontuacao += 2
	get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn")

func _on_spawnBarreira_timeout():
	var barreira = Barreira.instance()
	add_child(barreira)

func _on_ferramenta_area_entered(area):
	if area.name == "barreira":
		game_over()
	elif area.name == "pontuacao":
		score += 1 
		$score.text = ("PONTUAÇÃO\n %d" % [score])
		
func game_over():
	score = 0
	$score.text = ("PONTUAÇÃO\n %d" % [score])
	status = 0 #muda o status para "parado"
	$reiniciar.show()
	$spawnBarreira.stop()

func _on_TouchScreenButton_pressed():
	match current_state:
		State.first_time:
			iniciar_jogo()
			current_state = State.second_time
			$ferramenta.position.y -= 50
		State.second_time:
			$ferramenta.position.y -= 50
