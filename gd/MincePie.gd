extends Area2D
signal mincepie_collected

func _on_MincePie_body_entered(body):
	if body.name == "Player":
		body.add_mincepie()
		emit_signal("mincepie_collected")
		queue_free()

