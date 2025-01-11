extends Sprite2D

@onready var picture_display6 = $pokok_6

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if is_pixel_opaque(get_local_mouse_position()):
				print("clicked") 
				picture_display6.visible = true
			else:
				picture_display6.visible = false
