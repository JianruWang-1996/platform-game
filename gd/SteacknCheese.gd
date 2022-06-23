extends Area2D

signal steakncheese_collected

func _on_SteacknCheese_body_entered(body):
	if body.name == "Player":
		body.add_steackncheese()
		emit_signal("steakncheese_collected")
		queue_free()
