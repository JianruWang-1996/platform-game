#WorldCompleted.gd
extends Area2D

export(String, FILE, "*.tscn") var world_scene

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			get_tree().change_scene(world_scene)
			get_parent().queue_free()
			
