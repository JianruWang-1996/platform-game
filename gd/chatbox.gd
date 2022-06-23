extends Label


var drawTextSpeed:int = 0
var chatterLimit:int = 100 # max characters in chatbox
var dialog = ["Hey! My name is Dag. I am a pie connoisseur,",
"I love pies and I found a jungle that contains the perfect pies.",
"However, the jungle is now full of monsters, and I couldn't do it myself.",
"Please help me collect the pies from all the monsters."] # list of story lines
var skip_to_scene #scene to skip to

var page = 0

	
func _showChatter():
	if drawTextSpeed < chatterLimit: # print 1 char at a time
		drawTextSpeed += 1
		self.visible_characters = drawTextSpeed

func _process(delta):
	_showChatter()
	pass


func _on_next_pressed():
	if page < dialog.size()-1:
		page += 1
		set_text(dialog[page])
	else:
		get_tree().change_scene("res://scene/World.tscn")


func _on_skip_pressed():
	get_tree().change_scene("res://scene/World.tscn")
