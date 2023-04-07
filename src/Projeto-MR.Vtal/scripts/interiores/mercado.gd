extends Node2D
var n = 0 
var npc 
var npc_1 = Global.falas["NPC_1"]
var npc_2 = Global.falas["NPC_2"]
var controle_NPC_1 = false
var controle_NPC_2 = false
func _ready():
	Global.camera_state = Global.StateCameraClamp.Off
	$Personagem/Arrow.hide()

func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn")
func def_choices():
	$dialogo/CaixaDialogo/VBoxContainer/Escolha1.text = Global.falas[npc][n][0]
	$dialogo/CaixaDialogo/VBoxContainer/Escolha2.text = Global.falas[npc][n][1]
	$dialogo/CaixaDialogo/VBoxContainer/Escolha3.text = Global.falas[npc][n][2]
	$dialogo/CaixaDialogo/VBoxContainer/Escolha4.text = Global.falas[npc][n][3]
func _on_Button_pressed():
	n+=1
	if n == 4:
		if npc == "NPC_1":
			$dialogo/CaixaDialogo.hide()
			n = 0
			Global.speed = 250
		else: pass
	elif n == 2:
		if npc == "NPC_2":
			def_choices()
			$dialogo/CaixaDialogo/nome.hide()
			$dialogo/CaixaDialogo/conversa.hide()
			$dialogo/CaixaDialogo/Button.hide()
			$dialogo/CaixaDialogo/VBoxContainer.show()
		else:
			$dialogo/CaixaDialogo/nome.text = Global.falas[npc].nome
			$dialogo/CaixaDialogo/conversa.text = Global.falas[npc][n]
	elif n == 10:
		if npc == "NPC_2":
			$dialogo/CaixaDialogo.hide()
			n = 0
			Global.speed = 250
		else: pass
	elif n == 5:
		if npc == "NPC_2":
			$dialogo/CaixaDialogo.hide()
			n = 0
			Global.speed = 250
		else: pass
	elif n == 6:
		if npc == "NPC_2":
			$dialogo/CaixaDialogo.hide()
			Global.speed = 250
			n = 0
		else: pass
	else: 
		$dialogo/CaixaDialogo/nome.text = Global.falas[npc].nome
		$dialogo/CaixaDialogo/conversa.text = Global.falas[npc][n]
		


func _on_NPC_1_body_entered(body):
	if controle_NPC_1  == false:
		npc = "NPC_1"
		$dialogo/CaixaDialogo/nome.text = Global.falas[npc].nome
		$dialogo/CaixaDialogo/conversa.text = npc_1[n]
		$dialogo/CaixaDialogo.show()
		Global.speed = 0
		
	else:
		pass
func clear(): #encerra a cena 
	$dialogo/CaixaDialogo/VBoxContainer.queue_free()
	$dialogo/CaixaDialogo/Button.show()
	$dialogo/CaixaDialogo/conversa.show()
	$dialogo/CaixaDialogo/nome.show()

func _on_NPC_2_body_entered(body):
	if controle_NPC_2  == false:
		npc = "NPC_2"
		$dialogo/CaixaDialogo/nome.text =  Global.falas[npc].nome
		$dialogo/CaixaDialogo/conversa.text = npc_2[n]
		$dialogo/CaixaDialogo.show()
		Global.speed = 0
		
	else:
		pass


func _on_Escolha1_pressed():
	n+=1
	$dialogo/CaixaDialogo/nome.text =  Global.falas[npc].nome
	$dialogo/CaixaDialogo/conversa.text = Global.falas[npc][n]
	n=9
	clear()


func _on_Escolha2_pressed():
	n+=2
	$dialogo/CaixaDialogo/nome.text =  Global.falas[npc].nome
	$dialogo/CaixaDialogo/conversa.text = Global.falas[npc][n]
	clear()


func _on_Escolha3_pressed():
	n+=3
	$dialogo/CaixaDialogo/nome.text =  Global.falas[npc].nome
	$dialogo/CaixaDialogo/conversa.text = Global.falas[npc][n]
	clear()


func _on_Escolha4_pressed():
	$dialogo/CaixaDialogo/nome.text =  Global.falas[npc].nome
	$dialogo/CaixaDialogo/conversa.text = Global.falas[npc][n]
	clear()
