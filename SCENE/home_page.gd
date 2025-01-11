extends Node2D

func _ready():
	$GardenCoin2/Label.text = str(Global.duit)

	var picture_displays = [
		$Flower1/pokok_1,
		$Flower2/pokok_2,
		$Flower3/pokok_3,
		$Flower4/pokok_4,
		$Flower5/pokok_5,
		$Flower6/pokok_6,
		$Flower7/pokok_7,
		$Flower8/pokok_8,
		$Flower9/pokok_9,
		$Flower10/pokok_10,
		$Flower11/pokok_11,
		$Flower12/pokok_12,
		$Flower13/pokok_13,
		$Flower14/pokok_14,
		$Flower15/pokok_15,
		$Flower16/pokok_16
	]

	for picture_display in picture_displays:
		picture_display.visible = false

func _on_hat_btn_pressed():
	get_tree().change_scene_to_file("res://SCENE/GARDEN.tscn")
