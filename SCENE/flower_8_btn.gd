extends Button

@onready var picture_display8 = $pokok_8

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if picture_display8.visible:  
				picture_display8.visible = false
			else:
				picture_display8.visible = true
