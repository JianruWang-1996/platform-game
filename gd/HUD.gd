extends CanvasLayer
	
var max_life = 4


func _ready():
	var life = get_node("/root/Global").life
	
	if life == 4:
		$HP/heart.visible = true
		$HP/heart2.visible = true
		$HP/heart3.visible = true
		$HP/heart4.visible = true
	elif life == 3:
		$HP/heart.visible = true
		$HP/heart2.visible = true
		$HP/heart3.visible = true
		$HP/heart4.visible = false
	elif life == 2:
		$HP/heart.visible = true
		$HP/heart2.visible = true
		$HP/heart3.visible = false
		$HP/heart4.visible = false
	else:
		$HP/heart.visible = true
		$HP/heart2.visible = false
		$HP/heart3.visible = false
		$HP/heart4.visible = false
		
		

func _on_butterchicken_collected():
	$ITEM/butterchicken.visible = true

func _on_MincePie_mincepie_collected():
	$ITEM/mincepie.visible = true

func _on_steakncheese_collected():
	$ITEM/steackncheese.visible = true




func _on_ButterChicken_collected():
	$ITEM/butterchicken.visible = true


func _on_MincePie_collected():
	$ITEM/mincepie.visible = true


func _on_SteacknCheese_steakncheese_collected():
	$ITEM/steackncheese.visible = true





