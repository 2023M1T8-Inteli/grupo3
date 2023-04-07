extends CanvasLayer

signal blur_on
signal blur_off
signal mov_off
signal mov_on

var n = 2

func _ready():
	if OS.window_fullscreen:
		$ColorRect/checkMark.show()
	else: 
		$ColorRect/checkMark.hide()

func _on_TextureButton_button_down():
	$ColorRect/AnimationPlayer.play_backwards("options")	
	$TextureButton/Timer.start()
	
func _on_cdigo_vtal_pressed():
	pass # Replace with function body.

func _on_CheckBox_pressed():
	if n % 2 == 0:
		$ColorRect/checkMark.show()
		n += 1
	else:
		$ColorRect/checkMark.hide()
		n += 1
	if OS.window_fullscreen:
		OS.window_fullscreen = !OS.window_fullscreen
	else: 
		OS.window_fullscreen = true

func _on_resume_pressed():
	$hide.start()

func _on_menu_pressed():
	get_tree().change_scene("res://cenas/menu/Menu.tscn")

func _on_hide_timeout():
	$ColorRect/checkMark.hide()
	emit_signal("blur_off")
	emit_signal("mov_on")
	$TextureButton.show()
	$ColorRect/AnimationPlayer.play("options")
	

func _on_Timer_timeout():
	if n % 2 == 0:
		$ColorRect/checkMark.hide()
	else:
		$ColorRect/checkMark.show()
	emit_signal("blur_on")
	emit_signal("mov_off")
	$ColorRect.show()
	$TextureButton.hide()
