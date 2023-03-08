extends CanvasLayer

func timer():
	$Timer_transition.start()
	
func _ready():
	pass # Replace with function body.

func _on_Timer_timeout():
	queue_free()
