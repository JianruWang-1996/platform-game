extends Button

func _on_onemore_pressed():
	get_node("/root/Global").life = 4
	get_tree().change_scene("res://scene/World.tscn")
	get_parent().queue_free()
