extends StaticBody2D

var tree_type = 5
var tree_coverage = 7 #for global.canopypoint

var is_dragging = false
var mouse_offset


var is_inside_dropable = false
var body_ref

var start_position: Vector2  # To store the initial position of the tree node

func _ready():
	start_position = position
	


#show spot to plant
func _on_area_2d_body_entered(body:StaticBody2D):
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		body_ref = body
		if not body_ref.is_connected("tree_dropped", self, "_on_tree_dropped"):
			body_ref.connect("tree_dropped", self, "_on_tree_dropped")

func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		body.modulate = Color(Color.REBECCA_PURPLE, 0.7)
		


#dragging works
func _physics_process(delta):
	if is_dragging == true:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Check if the mouse position is near the StaticBody2D's position
			var mouse_pos = get_global_mouse_position()
			var distance = global_position.distance_to(mouse_pos)
			if distance < 32:  # Adjust this threshold to suit your needs
				print('clicked on tree1')
				is_dragging = true
				mouse_offset = get_global_mouse_position() - global_position
		else:
			print('out')
			is_dragging = false

			if is_inside_dropable and body_ref:
				print("Tree dropped on a valid platform.")
		# Notify the platform about the tree type
				body_ref.emit_signal("tree_dropped", tree_type)
			else:
				print("Tree not dropped on a valid platform. Returning to start position.")
				position = start_position  # Reset position if not dropped in a valid area


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		Global.treeselected = tree_type
		is_dragging = true
	
