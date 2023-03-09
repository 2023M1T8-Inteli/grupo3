extends Node2D
onready var nivel_imag = $VBoxContainer/nivel
func _ready():
	$VBoxContainer/pont_0.show()

func _process(delta):
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
	elif Global.pontuacao == 4:
		$VBoxContainer/pont_4.show()
		$Timer.start()
		$VBoxContainer/pont_1.hide()
		$VBoxContainer/pont_0.hide()
		$VBoxContainer/pont3.hide()	
		$VBoxContainer/pont_2.hide()
		
func _on_Timer_timeout():
	$VBoxContainer/pont_4.hide()
	$VBoxContainer/pont_0.show()
	$VBoxContainer/pont_1.hide()
	$VBoxContainer/pont3.hide()
	$VBoxContainer/pont_2.hide()
