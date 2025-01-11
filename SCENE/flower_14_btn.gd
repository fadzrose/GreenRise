extends Button

@onready var picture_display14 = $pokok_14

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if picture_display14.visible:  
				picture_display14.visible = false
			else:
				picture_display14.visible = true
