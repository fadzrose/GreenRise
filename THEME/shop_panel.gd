extends Control
#@onready var shop: Control= $Control

func _on_close_pressed() -> void:
		get_tree().change_scene_to_file("res://SCENE/GARDEN.tscn")
	#$Control.show()
	#shop.get_node("GardenShop").connect("pressed", _back_pressed)
	
	
