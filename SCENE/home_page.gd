extends Node2D

func _ready():
	$GardenCoin2/Label.text = str(Global.duit)
	
	var picture_display = $Flower1/Flower1Btn/pokok_1
	picture_display.visible = false
	
	var picture_display = $Flower2/Flower2Btn/pokok_2
	picture_display.visible = false
	
	var picture_display = $Flower3/Flower3Btn/pokok_3
	picture_display.visible = false
	
	var picture_display = $Flower4/Flower4Btn/pokok_4
	picture_display.visible = false

func _on_hat_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENE/GARDEN.tscn")
