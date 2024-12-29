extends Panel

var dialog_system = preload("res://SCENE/dialog.tscn").instantiate()


func _on_next_pressed():
	if not has_node("VSplitContainer/Dialog"):
		add_child(dialog_system)
	
	if has_node("VSplitContainer/Label"):
		var label_node = $VSplitContainer/Label
		label_node.visible = false  # Make the label invisible
	dialog_system.add_new_output("Mengikut ramalan cuaca, \nhujan lebat akan turun \ndi kawasan kita. Nyeiii")
