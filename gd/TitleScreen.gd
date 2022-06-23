extends MarginContainer

const world_scence = preload("res://scene/World.tscn")

onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selecter
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selecter
onready var selector_three = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selecter
 
var current_selection = 0

func _ready():
	set_current_selection(0)
	
func _process(delta):
	if Input.is_action_just_pressed("ui_down") && current_selection <= 1:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") && current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)

func handle_selection(_current_selection):
	if _current_selection == 0:
		get_tree().change_scene("res://scene/Intro.tscn")
		queue_free()
	if _current_selection == 1:
		get_tree().quit()
	if _current_selection == 2:
		get_tree().change_scene("res://scene/Control.tscn")
		queue_free()


func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"
	elif _current_selection == 2:
		selector_three.text = ">"
