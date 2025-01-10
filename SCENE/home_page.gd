extends Node2D

func _ready():
	$GardenCoin2/Label.text = str(Global.duit)
	
	var picture_display = $Flower1/Flower1Btn/pokok_1
	picture_display.visible = false
	
	var picture_display2 = $Flower2/Flower2Btn/pokok_2
	picture_display2.visible = false
	
	var picture_display3 = $Flower3/Flower3Btn/pokok_3
	picture_display3.visible = false
	
	var picture_display4 = $Flower4/Flower4Btn/pokok_4
	picture_display4.visible = false
	
	var picture_display5 = $Flower5/Flower5Btn/pokok_5
	picture_display5.visible = false
	
	var picture_display6 = $Flower6/Flower6Btn/pokok_6
	picture_display6.visible = false
	
	var picture_display7 = $Flower7/Flower7Btn/pokok_7
	picture_display7.visible = false
	
	var picture_display8 = $Flower8/Flower8Btn/pokok_8
	picture_display8.visible = false
	
	var picture_display9 = $Flower9/Flower9Btn/pokok_9
	picture_display9.visible = false
	
	var picture_display10 = $Flower10/Flower10Btn/pokok_10
	picture_display10.visible = false
	
	var picture_display11 = $Flower11/Flower11Btn/pokok_11
	picture_display11.visible = false
	
	var picture_display12 = $Flower12/Flower12Btn/pokok_12
	picture_display12.visible = false
	
	var picture_display13 = $Flower13/Flower13Btn/pokok_13
	picture_display13.visible = false
	
	var picture_display14 = $Flower14/Flower14Btn/pokok_14
	picture_display14.visible = false
	
	var picture_display15 = $Flower15/Flower15Btn/pokok_15
	picture_display15.visible = false

func _on_hat_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENE/GARDEN.tscn")
