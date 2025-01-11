extends Sprite2D

@onready var picture_display16 = $pokok_16

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if is_pixel_opaque(get_local_mouse_position()):
				print("clicked") 
				picture_display16.visible = true
			else:
				picture_display16.visible = false
