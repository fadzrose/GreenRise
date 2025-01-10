extends Control

@onready var _info_panel: Control= $infoPanel
@onready var _score_panel: Control= $Control/Panel

signal flood_game_added

func add_flood_game():
	var flood_game_instance = preload("res://SCENE/GDscript/FloodGame.tscn").instance()
	add_child(flood_game_instance)
	emit_signal("flood_game_added", flood_game_instance)


func _ready():
	#print_tree()
	Global.flood_game_instance = self
	#reset
	Global.canopypoint = 0
	Global.paras_air = 0
	Global.tempature = 0

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
	$GardenCoin.hide()
	

func update_thermometer():
	var canopy = Global.canopypoint
	var celsius = Global.tempature
	var suhu = $thermometer  # Adjust path if necessary
	if suhu:
		if canopy <= 31:
			suhu.frame = 0
			celsius = 50
		elif canopy <= 62:
			suhu.frame = 1
			celsius = 45
		elif canopy <= 93:
			celsius = 40
			suhu.frame = 2
		elif canopy <= 124:
			suhu.frame = 3
			celsius = 35
		elif canopy <= 155:
			suhu.frame = 4
			celsius = 30
		elif canopy <= 186:
			suhu.frame = 5
			celsius = 25
		elif canopy <= 217:
			suhu.frame = 6
			celsius = 20
		elif canopy <= 248:
			suhu.frame = 7
			celsius = 15

		print("Thermometer frame updated to:", suhu.frame)
		print("Current temperature:", celsius)
	else:
		print("Thermometer node not found!")
	Global.tempature = celsius

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
	$AnimationTimer.play("flood")# visualise the flood level based on data
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
	$TimerScore.start()
	_update_score_label()
	_calculate_water_level()
	_label_reward()
	$thermometer.hide()
	

func _update_score_label():
	var score_label = get_node("Control/Panel/VSplitContainer/VSplitContainer2/score")
	if score_label:
		score_label.text = str(Global.canopypoint)
	else:
		print("Score label not found.")

func _label_reward():
	
	var base_coins = 100 # Minimum reward
	var scaling_factor = 500.0 # Multiplier for dynamic scaling
	var max_canopy_size = 250.0 # Maximum canopy size
	var min_temperature = 15.0 # Minimum temperature
	var max_temperature = 50.0 # Maximum temperature
	
	# Player's values
	var canopy_size = Global.canopypoint
	var temperature = Global.tempature
	
	# Calculate Canopy Effect
	var canopy_effect = canopy_size / max_canopy_size
	canopy_effect = clamp(canopy_effect, 0.0, 1.0) # Ensure it's in range [0, 1]
	
	# Calculate Temperature Factor
	var temperature_factor = 1.0 - (temperature - min_temperature) / (max_temperature - min_temperature)
	temperature_factor = clamp(temperature_factor, 0.0, 1.0) # Ensure it's in range [0, 1]
	
	# Calculate Coins Earned
	var coins_earned = base_coins + scaling_factor * (canopy_effect * temperature_factor)
	coins_earned = round(coins_earned) # Round to nearest whole number
	
	# Debugging Outputs
	print("Base Coins: ", base_coins)
	print("Scaling Factor: ", scaling_factor)
	print("Canopy Effect: ", canopy_effect)
	print("Temperature Factor: ", temperature_factor)
	print("Coins Earned: ", coins_earned)
	
	
	Global.duit += coins_earned
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")
	
	var coin_label = get_node("Control/Panel/VSplitContainer/VSplitContainer2/score3")
	if coin_label:
		coin_label.text = str(coins_earned)
	else:
		print("Coins label not found.")

func _calculate_water_level():
	# highest flood level = 8m while lowest = 0m
	var base_water_level = 10.0 # Initial water level in meters
	var max_canopy_size = 250.0 # Maximum canopy size in the game
	var efficiency_factor = 1.2 # Increased canopy efficiency factor
	var min_temperature = 15.0 # Minimum temperature
	var max_temperature = 50.0 # Maximum temperature
	
	# Player's values
	var canopy_size = Global.canopypoint
	var temperature = Global.tempature
	
	# Calculate Temperature Factor
	var temperature_factor = 1.0 - (temperature - min_temperature) / (max_temperature - min_temperature)
	
	# Ensure Temperature Factor is in range [0, 1]
	temperature_factor = clamp(temperature_factor, 0.0, 1.0)
	
	# Calculate Water Level
	var canopy_effect = (canopy_size / max_canopy_size) * efficiency_factor
	var water_level = base_water_level * (1.0 - canopy_effect * temperature_factor)
	
	# Ensure Water Level is not below 0
	water_level = max(0.0, water_level)
	water_level = round(water_level * 100) / 100.0
	
	# Debugging Outputs
	print("Base Water Level: ", base_water_level)
	print("Canopy Effect: ", canopy_effect)
	print("Temperature Factor: ", temperature_factor)
	print("Water Level: ", water_level)
	
	
	var water_label = get_node("Control/Panel/VSplitContainer/VSplitContainer2/score2")
	if water_label:
		water_label.text = str(water_level)
	else:
		print("Coins label not found.")


func _keluar_btn_pressed():
	get_tree().change_scene_to_file("res://SCENE/homePage.tscn")

func _replay_btn_pressed():
	get_tree().change_scene_to_file("res://SCENE/GDscript/FloodGame.tscn")


func _on_timer_score_timeout() -> void:
	$Control.show()#add timer to show score
	$GardenCoin.show()
	_score_panel.get_node("Button2").connect("pressed", _keluar_btn_pressed)
	_score_panel.get_node("Button").connect("pressed", _replay_btn_pressed)
