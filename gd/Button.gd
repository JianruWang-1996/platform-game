extends Button

func _on_Button_pressed():
	get_tree().change_scene("res://scene/TitleScreen.tscn")
	get_parent().queue_free()
