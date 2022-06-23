extends Node2D

onready var life = 4 setget set_lives, get_lives

func set_lives(value):
	life = value	
	$HUD/LifeCount.set_text(str(life))	

func get_lives():	
	return life
