extends Area2D

var dialogo = Global.falas['situacao1']
var n = 1

func _ready():
	$CaixaDialogo/conversa.text = dialogo[0]

func _on_Situao1_body_entered(body):
	$Sprite/AnimationPlayer.play("Situacao1")
	$Timer.start()

func _on_Timer_timeout():
	$Timer.queue_free()
	$CaixaDialogo.show()
	
func _on_Button_pressed():
	if n == 3:
		print('hey')
		queue_free()
	else:
		$CaixaDialogo/conversa.text = dialogo[n]
		n += 1 
