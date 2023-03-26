extends Node2D

func _ready():
	Global.current_area = Global.state_areas.AREA_2
func _process(delta):
	match Global.current_area:
		Global.state_areas.AREA_1:
			$ColorRect/Label.text = "A area comercial ainda não esta liberada, resolva as situações éticas e faça as missões de sua area atual, para liberar esta nova area"
		Global.state_areas.AREA_2:
			$ColorRect/Label.text = "A  area de elite ainda não esta liberada, resolva as situações éticas e faça as missões de sua area atual, para liberar esta nova areaa"
		Global.state_areas.AREA_3:
			$ColorRect/Label.text = "O prédio da V.tal ainda não esta libedado, resolva  as situações restantes e se torne o rei da fibra para libera-la"
