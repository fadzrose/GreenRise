extends Button

@onready var picture_display11 = $pokok_11

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if picture_display11.visible:  
				picture_display11.visible = false
			else:
				picture_display11.visible = true