extends Node2D

var dialog_output = []
var DialogNode

func _ready():
	# Adjust the path based on your scene structure
	DialogNode = get_node("/root/Panel/VSplitContainer/Dialog")
	if DialogNode == null:
		print("Dialog node not found! Check the path in the script.")
		return
	
	# Ensure dialog_output has at least one element
	if dialog_output.size() > 0:
		DialogNode.bbcode_text = dialog_output[0]
	else:
		DialogNode.bbcode_text = ""  # Default to an empty string or a placeholder

func add_new_output(output: String):
	dialog_output.push_back(str(output))
	if DialogNode != null:
		DialogNode.bbcode_text = dialog_output[-1]  # Access the last added element
