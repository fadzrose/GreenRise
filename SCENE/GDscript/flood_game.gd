extends Control

@onready var _info_panel: Control= $infoPanel
@onready var _score_panel: Control= $Control

signal flood_game_added

func add_flood_game():
	var flood_game_instance = preload("res://SCENE/GDscript/FloodGame.tscn").instance()
	add_child(flood_game_instance)
	emit_signal("flood_game_added", flood_game_instance)


func _ready():
	print_tree()
	Global.flood_game_instance = self

	$infoPanel.hide()
	$timeoutPopup.hide()
	$FloodTimer.start()
	update_thermometer()  # Update thermometer on ready
	
	$AnimationTimer.play("timer")
	$"%level1".hide()
	$"%level2".hide()
	$"%level3".hide()
	$"%level4".hide()
	$awan.hide()
	$rainAnim.hide()
	$rainAnim2.animation = "default" 
	$rainAnim2.hide()
	$rainAnim3.animation = "default" 
	$rainAnim3.hide()
	$rainAnim4.animation = "default" 
	$rainAnim4.hide()
	$rainAnim5.animation = "default" 
	$rainAnim5.hide()
	$rainAnim.animation = "default" 
	$Control.hide()
	
	

func update_thermometer():
	var canopy = Global.canopypoint
	var suhu = $thermometer  # Adjust path if necessary
	if suhu:
		if canopy <= 31:
			suhu.frame = 0
		elif canopy <= 62:
			suhu.frame = 1
		elif canopy <= 93:
			suhu.frame = 2
		elif canopy <= 124:
			suhu.frame = 3
		elif canopy <= 155:
			suhu.frame = 4
		elif canopy <= 186:
			suhu.frame = 5
		elif canopy <= 217:
			suhu.frame = 6
		elif canopy <= 248:
			suhu.frame = 7

		print("Thermometer frame updated to:", suhu.frame)
	else:
		print("Thermometer node not found!")

func _on_canopy_updated():
	update_thermometer()  # Call the thermometer update function

func _on_btn_info_pressed() -> void:
	$infoPanel.show()
	_info_panel.get_node("Button").connect("pressed", _back_btn_pressed)

func _back_btn_pressed():
	$infoPanel.hide()
	


func _on_flood_timer_timeout() -> void:
	print("timeout")
	$timeoutPopup.show()
	$timeroutPopup.start()


func _on_timerout_popup_timeout() -> void:
	$timeoutPopup.hide()
	$Panel.hide()
	$tree1.hide()
	$tree2.hide()
	$tree3.hide()
	$tree4.hide()
	$tree5.hide()
	$tree6.hide()
	$tree7.hide()
	$AnimationTimer.play("flood")
	$heavyRain.play()
	$awan.show()  
	$rainAnim.show()
	$rainAnim5.show()
	$rainAnim2.show()
	$rainAnim3.show()
	$rainAnim4.show()
	$rainAnim.play()
	$rainAnim5.play()
	$rainAnim2.play()
	$rainAnim3.play()
	$rainAnim4.play()
	
	_update_score_label() #not update the label yet
	$Control.show()#add timer to show score
	
	#_score_panel.get_node("Button2").connect("pressed", _keluar_btn_pressed)

func _update_score_label():
	var score_label = get_node("Control/Panel/VSplitContainer/VSplitContainer/score")
	if score_label:
		score_label.text = str(Global.canopypoint)
	else:
		print("Score label not found.")


func _keluar_btn_pressed():
	get_tree().change_scene_to_file("res://SCENE/homePage.tscn")
