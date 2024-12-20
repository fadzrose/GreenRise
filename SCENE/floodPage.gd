extends Node2D

var raining: PackedScene = load("res://drops.tscn")

func _ready():
	connectSlots()

func _on_timer_rain_timeout():
	var rain = raining.instantiate()
	
	$rainDrops.add_child(rain)
	

func connectSlots():
	for slot in slots:
		var callable = Callable(onSlotClicked)
		callable = callable.bind(slot)
		slot.pressed.connect(callable)
	

func onSlotClicked(slot):
	pass
