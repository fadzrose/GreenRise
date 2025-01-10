extends Control

@onready var exitYesNo: Control= $exit
@onready var cr: Control= $kredit
@onready var set: Control= $setting

func _ready():
	$kredit.hide()
	$exit.hide()
	$setting.hide()
	MusicGlobal._music_on()

func _process(delta):
	pass

func _on_btn_power_pressed():
	$exit.show()
	exitYesNo.get_node("tidak").connect("pressed", _tidak_pressed)
	exitYesNo.get_node("ya").connect("pressed", _ya_pressed)

func _tidak_pressed():
	$exit.hide()

func _ya_pressed():
	get_tree().quit()

func _on_btn_setting_pressed():
	$setting.show()
	set.get_node("next").connect("pressed", _backSetting_pressed)


func _on_btn_credit_pressed():
	$kredit.show()
	cr.get_node("next").connect("pressed", _backCredit_pressed)

func _backSetting_pressed():
	$setting.hide()

func _backCredit_pressed():
	$kredit.hide()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://SCENE/homePage.tscn")
