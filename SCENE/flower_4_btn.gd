extends Button

@onready var picture_display4 = $pokok_4

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if picture_display4.visible:  
				picture_display4.visible = false
			else:
				picture_display4.visible = true
