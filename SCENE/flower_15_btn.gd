extends Button

@onready var picture_display15 = $pokok_15

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if picture_display15.visible:  
				picture_display15.visible = false
			else:
				picture_display15.visible = true
