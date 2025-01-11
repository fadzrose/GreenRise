extends Sprite2D

@onready var picture_display3 = $pokok_3

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if is_pixel_opaque(get_local_mouse_position()):
				print("clicked") 
				picture_display3.visible = true
			else:
				picture_display3.visible = false
