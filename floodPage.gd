extends Node2D

var raining: PackedScene = load("res://drops.tscn")

func _on_timer_rain_timeout():
	var rain = raining.instantiate()
	
	$rainDrops.add_child(rain)
