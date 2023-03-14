extends Node

export (PackedScene) var Inimigo #instancia a cena do inimigo em uma variável
var score #pontuação do jogador
var meta = 30 #pontuação necessária para vencer o jogo

func _ready():
	randomize()

func game_over(): #chamada ao colidir com um inimigo. Para o jogo, e logo em seguida o reinicia
	$pontuacaoTimer.stop()
	$inimigoTimer.stop()
	$HUDMG3.exibir_gameover()
	$musica.stop()
	$somMorte.play()
	
func venceu(): #chamada ao atingir a pontuação necessária, pausa a movimentação do jogador e exibe o texto vencedor
	$pontuacaoTimer.stop()
	$inimigoTimer.stop()
	$musica.stop()
	$jogadorMG3.parar()
	$jogadorMG3.hide()
	$HUDMG3.exibir_ganhou()
	
func _process(delta): #se chegar na pontuação da meta, executa a função "venceu()"
	if score == meta:
		venceu()
	
func novo_jogo(): #chamada ao clicar no botão de iniciar. Inicia os timers que darão inicio ao jogo.
	score = 0
	$jogadorMG3.start($posicaoInicial.position)
	$inicioTimer.start()
	$HUDMG3.exibir_mensagem("Prepare-se\nChegue aos %d pontos para ganhar!" % [meta])
	$HUDMG3.atualiza_score(score)
	$musica.play()

func _on_inicioTimer_timeout(): #termina após se chamar a função novo_jogo. Inicia o timer do spawn dos inimigos e da pontuação
	$inimigoTimer.start()
	$pontuacaoTimer.start()
	
func _on_pontuacaoTimer_timeout(): #soma mais um à pontuação a cada segundo que o jogador sobrevive
	score += 1 
	$HUDMG3.atualiza_score(score)

func _on_inimigoTimer_timeout(): #spawna o inimigo em um canto aleatório do mapa a cada intervalo de 0.8 segundos
	$caminhoInimigo/spawnInimigo.offset = randi() #randomiza o local de spawn do inimigo
	var inimigo = Inimigo.instance()
	add_child(inimigo)
	var direcao = $caminhoInimigo/spawnInimigo.rotation + PI / 2 
	inimigo.position =  $caminhoInimigo/spawnInimigo.position 
	direcao += rand_range(- PI / 4, PI / 4) #aleatoriza a direção que o inimigo irá se locomover no mapa
	inimigo.rotation = direcao
	inimigo.linear_velocity = Vector2(rand_range(inimigo.min_speed, inimigo.max_speed) , 0)
	inimigo.linear_velocity = inimigo.linear_velocity.rotated(direcao)
