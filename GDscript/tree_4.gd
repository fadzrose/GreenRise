extends StaticBody2D

var tree_type = 4
var tree_coverage = 4  # For global.canopypoint

var is_dragging = false
var mouse_offset = Vector2()

var is_inside_dropable = false
var body_ref = null

var start_position: Vector2  # To store the initial position of the tree node
var is_planted = false  # Flag to prevent further dragging after planting

func _ready():
	start_position = position

# Detect when the tree enters a platform's area
func _on_area_2d_body_entered(body: StaticBody2D):
	if body.is_in_group("dropable"):
		is_inside_dropable = true
		body.modulate = Color(Color.WHITE, 1) 
		body_ref = body
		if not body_ref.is_connected("tree_dropped", self, "_on_tree_dropped"):
			body_ref.connect("tree_dropped", self, "_on_tree_dropped")

# Detect when the tree exits a platform's area
func _on_area_2d_body_exited(body):
	if body.is_in_group("dropable"):
		is_inside_dropable = false
		body.modulate = Color(Color.WHITE, 0.7)
		body_ref = null

# Handle dragging behavior
func _physics_process(delta):
	if is_dragging and not is_planted:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)

# Handle mouse input for dragging and dropping
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if not is_planted:
				var mouse_pos = get_global_mouse_position()
				if global_position.distance_to(mouse_pos) < 32:
					is_dragging = true
					mouse_offset = mouse_pos - global_position
		else:
			if is_dragging:
				is_dragging = false
				if is_inside_dropable and body_ref:
					plant_tree()  # Plant the tree on the platform
				else:
					position = start_position  # Reset to start position if not dropped on a valid area

# Plant the tree and duplicate itself
func plant_tree():
	is_planted = true  
	body_ref.emit_signal("tree_dropped", tree_type)  
	snap_to_platform()
	duplicate_tree()  # Create a duplicate tree at the start position

# Snap the tree to the platform's position
func snap_to_platform():
	position = body_ref.position  
	global_position += body_ref.global_position - global_position

# Create a new tree node at the default position
func duplicate_tree():
	var tree_scene = preload("res://GDscript/tree_4.tscn")
	var new_tree = tree_scene.instance()
	get_parent().add_child(new_tree)
	new_tree.position = start_position
	new_tree.global_position = start_position
