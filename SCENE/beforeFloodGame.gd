extends Control

@onready var _info_play: Control= $infoPlay
@onready var _info_panel: Control= $infoPanel
@onready var _start_game: Control= $startGame

func _ready() -> void:
	_info_panel.hide()
	_start_game.hide()
	
	_info_play.get_node("Info").connect("pressed", _long_info_pressed)
	_info_play.get_node("PlayBtn").connect("pressed", _long_play_pressed)

func _long_info_pressed() -> void:
	_info_panel.show()
	_info_panel.get_node("Button").connect("pressed", _back_btn_pressed)
	

func _long_play_pressed() ->void:
	_info_play.hide()
	_start_game.show()
	_start_game.get_node("btnInfo").connect("pressed", _long_info_pressed)
	_start_game.get_node("PlayBtn").connect("pressed", _on_play_button_pressed)

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENE/FloodGame.tscn")

func _back_btn_pressed() -> void:
	_info_panel.hide()
