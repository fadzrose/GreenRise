extends Button

@onready var picture_display16 = $pokok_16

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if picture_display16.visible:  
				picture_display16.visible = false
			else:
				picture_display16.visible = true
