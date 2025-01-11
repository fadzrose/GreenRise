extends Button

@onready var picture_display7 = $pokok_7

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if picture_display7.visible:  
				picture_display7.visible = false
			else:
				picture_display7.visible = true
