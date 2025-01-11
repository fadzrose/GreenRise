extends Button

@onready var picture_display13 = $pokok_13

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if picture_display13.visible:  
				picture_display13.visible = false
			else:
				picture_display13.visible = true
