extends Area2D

var pontuacao = Global.pontuacao #utilizando a variavel definida no script do global
var dialogo = Global.falas['situacao1'] #utiliando a variavel definida no script do global
var n = 1 #controle do diálogo
var timer = Timer.new() #tempo de transição
onready var imagem = $atencao #carrega a imagem atenção 

func _ready(): #
	$CanvasLayer.comecar_reverso()
	$CanvasLayer.timer() #inicia o tempo e animação reversa acima 
	$CaixaDialogo/nome.text = dialogo.nome
	$CaixaDialogo/conversa.text = dialogo[0] #carrega caixa de diálogo 
	$CaixaDialogo/VBoxContainer/Escolha1.hide() #esconde escolhas e feedback enquanto aparece perguntas 
	$CaixaDialogo/VBoxContainer/Escolha2.hide()
	$CaixaDialogo/VBoxContainer/Escolha3.hide()
	$CaixaDialogo/VBoxContainer/Escolha4.hide()
	$CaixaDialogo.hide()
	$NPC.hide()
	$atencao.hide()
	$parabens.hide()

func _on_Situao1_body_entered(body): #quando o jogador entra na área definida inicia a cena 
	$NPC.show()
	$NPC/AnimationPlayer.play("Situacao1")
	$Timer.start()

func _on_Timer_timeout(): #carrega caixa de diálogo
	$Timer.queue_free()
	$CaixaDialogo.show()
	$NPC.animation = "esquerda"[0]
	$NPC.stop()
	
func _on_Button_pressed(): #após a apresentação da pergunta as escolhas aparecem 
	if n == 3:
		$CaixaDialogo/conversa.hide()
		$CaixaDialogo/Button.hide()
		$CaixaDialogo/VBoxContainer/Escolha1.show()
		$CaixaDialogo/VBoxContainer/Escolha2.show()
		$CaixaDialogo/VBoxContainer/Escolha3.show()
		$CaixaDialogo/VBoxContainer/Escolha4.show()
	else:
		$CaixaDialogo/conversa.text = dialogo[n]
		n += 1 
	
func _on_Escolha1_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	dialogo = dialogo[n][1]
	pontuacao += 2
	clear() 
	$CaixaDialogo.queue_free()
	$parabens.visible = true
#	imagem.texture = load(dialogo.feedback) #código comentado porque fiz essa função de outra forma. Ver com o Ever qual se encaixa melhor
	$parabens/feedback.text = dialogo.text
	n += 1
	
func _on_Escolha2_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	dialogo = dialogo[n][2]
	pontuacao += 1
	clear()
	$CaixaDialogo.queue_free()
#	imagem.texture = load(dialogo.feedback)
	$parabens.show()
	$parabens/feedback.text = dialogo.text
	n += 1
	
func _on_Escolha3_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	dialogo = dialogo[n][3]
	pontuacao += 0
	clear()
	$CaixaDialogo.queue_free()
	$atencao.show()
#	imagem.texture = load(dialogo.feedback)
	$atencao/feedback.text = dialogo.text
	n += 1
	
func _on_Escolha4_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	dialogo = dialogo[n][4]
	pontuacao += -1
	clear()
	$CaixaDialogo.queue_free()
#	imagem.texture = load(dialogo.feedback)
	$atencao.show()
	$atencao/feedback.text = dialogo.text
	n += 1 #controle de ordem de fala de acordo com o dicionário global 
	
func clear(): #encerra a cena 
	$CaixaDialogo/VBoxContainer/Escolha1.queue_free()
	$CaixaDialogo/VBoxContainer/Escolha2.queue_free()
	$CaixaDialogo/VBoxContainer/Escolha3.queue_free()
	$CaixaDialogo/VBoxContainer/Escolha4.queue_free()
	$CaixaDialogo/Button.show()
	
func _on_passar_pressed(): #volta o personagem para o mapa 
	print(pontuacao)
	print(Global.pontuacao)
	Global.atualizar_pontuacao(pontuacao)
	if Global.pontuacao == 2:
		Global.nivel_2 = true
	Global.controle_false()
	get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn") # Replace with function body.
