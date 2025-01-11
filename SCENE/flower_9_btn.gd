extends Button

@onready var picture_display9 = $pokok_9

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if picture_display9.visible:  
				picture_display9.visible = false
			else:
				picture_display9.visible = true
