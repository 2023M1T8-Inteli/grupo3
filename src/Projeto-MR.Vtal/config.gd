extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_button_down():
	$ColorRect.show()
	$ColorRect/AnimationPlayer.play_backwards("options")
	 # Replace with function body.
	$TextureButton/Timer.start()

func _on_Timer_timeout():
	$TextureButton.hide()


func _on_cdigo_vtal_pressed():
	pass # Replace with function body.
