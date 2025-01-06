extends StaticBody2D

var sceneT2 = preload("res://GDscript/tree_2.tscn")

func _get_drag_data(at_position: Vector2) -> Variant:
	var data = 2 
	
	var newTree = sceneT2.instance()
	add_child(newTree)
	
	var prev = newTree
	
	# set_drag_preview(prev)
	
	return data
