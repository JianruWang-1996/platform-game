extends Node

var total_pie = 0

func _on_ButterChicken_body_entered():
	total_pie += 1
	$ITEM/butterchicken.set_self_modulate("ffffff")

func _on_MincePie_body_entered():
	total_pie += 1
	$ITEM/mincepie.set_self_modulate("ffffff")

func _on_SteacknCheese_body_entered():
	total_pie += 1
	$ITEM/steackncheese.set_self_modulate("ffffff")

func _release_pies():	
	$ITEM/butterchicken.set_self_modulate("202020")
	$ITEM/mincepie.set_self_modulate("202020")
	$ITEM/steackncheese.set_self_modulate("202020")
	total_pie = 0
