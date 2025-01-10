extends Sprite2D

@onready var picture_display = $Flower1Btn/pokok_1

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed_index == MOUSE_BUTTON_LEFT : 
		picture_display.visible = true
