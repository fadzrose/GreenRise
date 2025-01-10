extends Node2D

func _ready():
	$GardenCoin2/Label.text = str(Global.duit)
	
	var picture_display = $Flower1/Flower1Btn/pokok_1
	picture_display.visible = false
	

func _on_hat_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENE/GARDEN.tscn")

func _on_to_main_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENE/SplashPage.tscn")
