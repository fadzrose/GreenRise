extends Button

@onready var picture_display6 = $pokok_6

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if picture_display6.visible:  
				picture_display6.visible = false
			else:
				picture_display6.visible = true
