extends StaticBody2D

var selected = false
var tree_type = 5
var tree_coverage = 5 # For Global.canopypoint
var mouse_offset
var start_position: Vector2

func _ready():
	
	start_position = position

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed: # Mouse button pressed
			#Global.treeselected = tree_type
			print("treeselected value updated")
			selected = true
		else:
			pass #position = start_position

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Check if the mouse position is near the StaticBody2D's position
			var mouse_pos = get_global_mouse_position()
			var distance = global_position.distance_to(mouse_pos)
			if distance < 32:  # Adjust this threshold to suit your needs
				print('clicked on tree5')
				selected = true
				Global.treeselected = tree_type
				mouse_offset = get_global_mouse_position() - global_position
		else:
			print('out5')
			selected = false
			#Global.selectedDropped = true
			position = start_position
