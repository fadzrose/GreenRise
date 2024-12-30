extends Sprite2D

var is_dragging = false
var mouse_offset
var delay = 1

func _physics_process(delta):
	if is_dragging == true:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", get_global_mouse_position()-mouse_offset, delay * delta)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				print('clicked on tree1')
				is_dragging = true
				mouse_offset = get_global_mouse_position()-global_position
		else:
			print('out')
			is_dragging = false
	else:
		print("tree_1 is missing or does not have 'is_dragging'")