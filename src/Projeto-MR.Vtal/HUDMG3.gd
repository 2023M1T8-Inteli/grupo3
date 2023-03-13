extends CanvasLayer

signal start_game #sinal enviado ao iniciar o jogo

func exibir_mensagem(text): #função para mudar o texto a ser exibido mais facilmente
	$messageLabel.text = text
	$messageLabel.show()
	$messageTimer.start()
	
func exibir_gameover(): #exibe a tela de game over, quando o jogador colide com um inimigo
	exibir_mensagem("Fim de Jogo!\nTente novamente")
	yield($messageTimer, "timeout")
	
	#reinicia o jogo, para que possa ser iniciado novamente
	$messageLabel.text = "Desvie dos executivos corruptos e mantenha sua conduta ética intacta!"
	$messageLabel.show()
	yield(get_tree().create_timer(1), "timeout")
	$inicioButton.show()
	
func exibir_ganhou(): #muda a mensagem do texto ao ganhar o jogo
	exibir_mensagem("Parabéns, você conseguiu!")
	
func atualiza_score(score): #atualiza o texto da pontuação
	$scoreLabel.text = str(score)
	
func _on_inicioButton_pressed(): #inicia o jogo ao clicar no botão
	$inicioButton.hide()
	emit_signal("start_game")
	
func _on_messageTimer_timeout(): #esconde a mensagem ao iniciar o jogo
	$messageLabel.hide()
