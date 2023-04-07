extends Node2D

func _on_TextureButton_pressed():
	$clickButton.hide()
	Global.controle_nathalia = true
	$Sprite/TextureButton/AnimationPlayer.play_backwards("slide")
	
func _on_Quest_timeout():
	$descida.start()
	Global.speed = 0

func _on_descida_timeout():
	$Sprite/TextureButton/AnimationPlayer.play("slide")
	$pisca.start()

func _on_pisca_timeout():
	match Global.current_state:
		Global.State.Situacao1_finish:
			$clickButton.show()
		_:
			$clickButton.hide()
	$Sprite/TextureButton/AnimationPlayer.play("call")
