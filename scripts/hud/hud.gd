extends Node2D
onready var nivel_imag = $VBoxContainer/nivel
var imagem = Global.moldura
func _ready(): #mostra a pontuação zerada ao iniciar o jogo
	$VBoxContainer/nome_nivel.show()
	$VBoxContainer/pont_0.show()
	
	if Global.pontuacao == 1:
		$VBoxContainer/pont_1.show()
		$VBoxContainer/pont_2.hide()
		$VBoxContainer/pont_0.hide()
		$VBoxContainer/pont3.hide()
		$VBoxContainer/pont_4.hide()
		
	elif Global.pontuacao == 2:
		$VBoxContainer/pont_2.show()
		$VBoxContainer/pont_1.hide()
		$VBoxContainer/pont_0.hide()
		$VBoxContainer/pont3.hide()
		$VBoxContainer/pont_4.hide()
		
	elif Global.pontuacao == 3:
		$VBoxContainer/pont3.show()
		$VBoxContainer/pont_2.hide()
		$VBoxContainer/pont_1.hide()
		$VBoxContainer/pont_0.hide()
		$VBoxContainer/pont_4.hide()
		
	elif Global.pontuacao == 4  :
		Global.nivel_index += 1
		$VBoxContainer/pont_1.hide()
		$VBoxContainer/pont_0.hide()
		$VBoxContainer/pont3.hide()	
		$VBoxContainer/pont_2.hide()
		$VBoxContainer/pont_4.show()
		match Global.nivel_index:
			1:
				Global.current_nivel =  Global.state_nivel.N2
				Global.cutscene_index = 0
			2:
				Global.current_nivel =  Global.state_nivel.N3
				Global.cutscene_index = 0
			3:
				Global.current_nivel = Global.state_nivel.N4
				Global.cutscene_index = 0
				Global.current_area = Global.state_areas.FINAL
				
		$timer_hud.start()
		
		Global.pontuacao = 0
		
		
	elif  Global.pontuacao <=0:
		$VBoxContainer/pont_4.hide()
		$VBoxContainer/pont_0.show()
		$VBoxContainer/pont_1.hide()
		$VBoxContainer/pont3.hide()
		$VBoxContainer/pont_2.hide()
	$VBoxContainer/nome_nivel.texture = load(imagem)
		
#	match Global.current_nivel:
#		Global.state_nivel.N2:
#			$VBoxContainer/nome_nivel.texture = load("res://imagens/níveis/MolduraDuquePronta.png")
#			Global.current_area = Global.state_areas.AREA_2
#		Global.state_nivel.N3:
#			$VBoxContainer/nome_nivel.texture = load("res://imagens/níveis/MolduraGeneralPronta.png")
#			Global.current_area = Global.state_areas.AREA_3
#		Global.state_nivel.N4:
#			$VBoxContainer/nome_nivel.texture = load("res://imagens/níveis/MolduraGeneralPronta.png")
func _process(delta): #atualiza a hud a medida que ganha pontuação
	if Global.pontuacao == 1:
		$VBoxContainer/pont_1.show()
		$VBoxContainer/pont_2.hide()
		$VBoxContainer/pont_0.hide()
		$VBoxContainer/pont3.hide()
		$VBoxContainer/pont_4.hide()

	elif Global.pontuacao == 2:
		$VBoxContainer/pont_2.show()
		$VBoxContainer/pont_1.hide()
		$VBoxContainer/pont_0.hide()
		$VBoxContainer/pont3.hide()
		$VBoxContainer/pont_4.hide()

	elif Global.pontuacao == 3:
		$VBoxContainer/pont3.show()
		$VBoxContainer/pont_2.hide()
		$VBoxContainer/pont_1.hide()
		$VBoxContainer/pont_0.hide()
		$VBoxContainer/pont_4.hide()

	elif Global.pontuacao == 4  :
		Global.nivel_index += 1
		$VBoxContainer/pont_1.hide()
		$VBoxContainer/pont_0.hide()
		$VBoxContainer/pont3.hide()	
		$VBoxContainer/pont_2.hide()
		$VBoxContainer/pont_4.show()
		match Global.nivel_index:
			1:
				Global.current_nivel =  Global.state_nivel.N2

			2:
				Global.current_nivel =  Global.state_nivel.N3
				
			3:
				Global.current_nivel = Global.state_nivel.N4
		$timer_hud.start()

		


	elif  Global.pontuacao <=0:
		$VBoxContainer/pont_4.hide()
		$VBoxContainer/pont_0.show()
		$VBoxContainer/pont_1.hide()
		$VBoxContainer/pont3.hide()
		$VBoxContainer/pont_2.hide()
#
	
func _on_timer_hud_timeout():
	
	print(Global.nivel_index)
	
	$VBoxContainer/pont_4.hide()
	$VBoxContainer/pont_0.show()
	$VBoxContainer/pont_1.hide()
	$VBoxContainer/pont3.hide()
	$VBoxContainer/pont_2.hide()
	Global.pontuacao = 0
	match Global.current_nivel:
		Global.state_nivel.N2:
			$VBoxContainer/nome_nivel.texture = load("res://imagens/niveis/MolduraDuquePronta.png")
			Global.moldura ="res://imagens/niveis/MolduraDuquePronta.png"
			Global.current_area = Global.state_areas.AREA_2
		Global.state_nivel.N3:
			$VBoxContainer/nome_nivel.texture = load("res://imagens/niveis/MolduraGeneralPronta.png")
			Global.moldura = "res://imagens/niveis/MolduraGeneralPronta.png"
			Global.current_area = Global.state_areas.AREA_3
		Global.state_nivel.N4:
			$VBoxContainer/nome_nivel.texture = load("res://imagens/niveis/MolduraGeneralPronta.png")
			Global.moldura = "res://imagens/niveis/MolduraGeneralPronta.png"
			Global.current_area = Global.state_areas.FINAL
	print(Global.pontuacao)
