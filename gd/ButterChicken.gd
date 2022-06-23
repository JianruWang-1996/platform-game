extends Area2D

signal butterchicken_collected


func _on_ButterChicken_body_entered(body):
	if body.name == "Player":
		body.add_butterchicken()
		emit_signal("butterchicken_collected")
		queue_free()
