extends Button

@onready var picture_display5 = $pokok_5

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if picture_display5.visible:  
				picture_display5.visible = false
			else:
				picture_display5.visible = true
