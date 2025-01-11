extends Control

var amount1 = 80 #pokok biasa
var amount2 = 150 #pokok hiasan
var amount3 = 180 #pokok native

#close shop panel
func _on_close_shop_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENE/GARDEN.tscn")

#buy button deduct duit refer flood_game
func _on_beli_1_pressed() -> void:
	Global.duit -= amount2
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")


func _on_beli_2_pressed() -> void:
	Global.duit -= amount2
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")


func _on_beli_3_pressed() -> void:
	Global.duit -= amount2
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")


func _on_beli_4_pressed() -> void:
	Global.duit -= amount1
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")


func _on_beli_5_pressed() -> void:
	Global.duit -= amount2
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")


func _on_beli_6_pressed() -> void:
	Global.duit -= amount3
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")


func _on_beli_7_pressed() -> void:
	Global.duit -= amount3
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")


func _on_beli_8_pressed() -> void:
	Global.duit -= amount1
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")


func _on_beli_9_pressed() -> void:
	Global.duit -= amount3
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")


func _on_beli_10_pressed() -> void:
	Global.duit -= amount3
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")


func _on_beli_11_pressed() -> void:
	Global.duit -= amount3
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")


func _on_beli_12_pressed() -> void:
	Global.duit -= amount2
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")


func _on_beli_13_pressed() -> void:
	Global.duit -= amount2
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")


func _on_beli_14_pressed() -> void:
	Global.duit -= amount1
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")


func _on_beli_15_pressed() -> void:
	Global.duit -= amount1
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")


func _on_beli_16_pressed() -> void:
	Global.duit -= amount1
	var total_duit = get_node("GardenCoin/Label")
	if total_duit:
		total_duit.text = str(Global.duit)
	else:
		print("total Coins label not found.")
