extends Button

func _on_menu_pressed():
	get_tree().change_scene("res://scene/TitleScreen.tscn")
	get_parent().queue_free()
