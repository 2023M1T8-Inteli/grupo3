extends CanvasLayer

func _ready():
	pass # Replace with function body.

func _on_TextureButton_button_down():
	$ColorRect.show()
	$ColorRect/AnimationPlayer.play_backwards("options")
	 # Replace with function body.
	$TextureButton/Timer.start()

func _on_Timer_timeout():
	$TextureButton.hide()

func _on_cdigo_vtal_pressed():
	pass # Replace with function body.
