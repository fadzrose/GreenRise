extends Button


@onready var picture_display = $pokok_1

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			print("Flower1 clicked!")
			picture_display.visible = true
