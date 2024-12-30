extends StaticBody2D

func _ready():
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)

func _process(delta):
	# Get a reference to tree_1
	var tree_1 = get_node("res://SCENE/tree_1.gd")  # Adjust the path as needed

	# Check if tree_1 has the `is_dragging` property
	if tree_1 and tree_1.has_method("is_dragging"):
		if tree_1.is_dragging:
			visible = true
		else:
			visible = false
