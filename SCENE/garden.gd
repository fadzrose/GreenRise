extends Control
@onready var shop: Control= $Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control.hide()
	$GardenCoin2/Label.text = str(Global.duit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_garden_shop_pressed() -> void:
		get_tree().change_scene_to_file("res://THEME/shop_panel.tscn")
	#$Control.show()
	#shop.get_node("GardenShop").connect("pressed", _back_pressed)

func _back_pressed():
	$Control.hide()


func _on_door_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENE/homePage.tscn")
