extends Node2D

var status = 0
var score = 0
var y = 0.8
var x = 2




func _ready():
	pass
	

func _process(delta):
	if status == 1:
		$background.position.x -= 1*x    
		if ($background.position.x) < -100:
			$background.position.x = 1048
		$columns.position.x -= 2*x           
		if ($columns.position.x) < -300:
			$columns.position.x = rand_range(200, 600) - 50
			$columns.position.y = rand_range(0, 400) - 200
		$dragon.position.y += y


		if $dragon.position.y > 600:
			$dragon.position.y = 480
			status = 0


		if $dragon.position.y < -20:
			$dragon.position.y = -20
		if Input.is_action_pressed("ui_down"):
				$dragon.position.y += 2

		if Input.is_action_pressed("ui_up"):
			$dragon.position.y -= 4
		if score >= 5:
			$dragon/passou.show()
			#código que adiciona pontos globais         adicionar
			
			
	


func _on_game_over_pressed():
	status = 1
	$game_over.hide()
	
	
	
func _on_columns_body_shape_entered(body_id, body, body_shape, local_shape):
	if (local_shape < 2): # esse node tem 3 shapes de colisão: 0 e 1 são as colunas
		status = 0 # muda o status para "parado"
		$dragon/Button_final.show()
		if score>=5:
			$dragon/sair_ganho.show()

# executa essa função quando o dragão atravessa entre as colunas
func _on_columns_body_shape_exited(body_id, body, body_shape, local_shape):
	if (local_shape == 2): # esse node tem 3 shapes de colisão: 0 e 1 são as colunas
		score += 1 # aumenta o score
		print(score)
		$dragon/score.text = str(score) # atualiza o painel
		
		
	
	
func _on_Button_final_pressed():
	status = 1
	$dragon/Button_final.hide()


func _on_sair_ganho_pressed():
	pass # código para trocar para a cena do mapa
