extends Node2D

func _ready():
	$GardenCoin2/Label.text = str(Global.duit)

func _on_hat_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENE/GARDEN.tscn")
