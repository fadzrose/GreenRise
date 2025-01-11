extends StaticBody2D

var selected = true  # Start with the seed selected and following the cursor
var seed_type = 1
var grow_time = 6
var mouse_offset: Vector2
var stop_dragging = false  # To detect when dragging stops

var platform

func _ready():
	_seed_cursor()
	for child in get_parent().get_children():
		if child.name == "seedGrow":
			platform = child
			platform.connect("input_event", Callable(self, "_on_Platform_Area2D_input_event"))
			print("Connected to platform:", platform)


func _seed_cursor():
	print("Dragging seed node")
	selected = true
	mouse_offset = Vector2.ZERO

func _physics_process(delta):
	if selected and not stop_dragging:
		global_position = get_global_mouse_position()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and not stop_dragging:
			print("Stop dragging on platform collision")
			selected = false
			stop_dragging = true  # Prevent further movement

func _on_Platform_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			print("Seed placed on platform")
			selected = false 
			stop_dragging = true
			hide()
