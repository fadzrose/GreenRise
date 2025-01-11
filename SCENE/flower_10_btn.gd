extends Button

@onready var picture_display10 = $pokok_10

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if picture_display10.visible:  
				picture_display10.visible = false
			else:
				picture_display10.visible = true
