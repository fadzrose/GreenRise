extends Button

@onready var picture_display3 = $pokok_3

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if picture_display3.visible:  
				picture_display3.visible = false
			else:
				picture_display3.visible = true
