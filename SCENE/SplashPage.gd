extends Control

@onready var exitYesNo: Control= $exit
@onready var cr: Control= $kredit
@onready var settings: Control= $setting
@onready var src: Control= $RUJUKAN
@onready var how: Control= $HowToPlay

func _ready():
	$kredit.hide()
	$exit.hide()
	$setting.hide()
	$HowToPlay.hide()
	$RUJUKAN.hide()
	MusicGlobal._music_on()

func _process(delta):
	pass

func _on_btn_power_pressed():
	$setting.hide()
	$exit.show()
	exitYesNo.get_node("tidak").connect("pressed", _tidak_pressed)
	exitYesNo.get_node("ya").connect("pressed", _ya_pressed)

func _tidak_pressed():
	$exit.hide()

func _ya_pressed():
	get_tree().quit()

func _on_btn_setting_pressed():
	$setting.show()
	settings.get_node("next").connect("pressed", _back_pressed)
	settings.get_node("Button").connect("pressed", _on_btn_credit_pressed)#kredit
	settings.get_node("Button2").connect("pressed", _rujukan_pressed)#rujukan
	settings.get_node("Button3").connect("pressed", _cara_bermain_pressed)#how play
	settings.get_node("Button4").connect("pressed", _on_btn_power_pressed)#keluar

func _cara_bermain_pressed():
	
	$HowToPlay.show()
	how.get_node("next").connect("pressed", _back_pressed)

func _rujukan_pressed():
	
	$RUJUKAN.show()
	src.get_node("next").connect("pressed", _back_pressed)

func _on_btn_credit_pressed():
	
	$kredit.show()
	cr.get_node("next").connect("pressed", _back_pressed)

func _back_pressed():
	$setting.hide()
	$kredit.hide()
	$HowToPlay.hide()
	$RUJUKAN.hide()


func _on_button_pressed():
	get_tree().change_scene_to_file("res://SCENE/homePage.tscn")
