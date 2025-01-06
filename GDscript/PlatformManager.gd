extends Node

var platforms = []

func register_platform(platform):
	platforms.append(platform)
	platform.connect("tree_planted_signal", self, "_on_tree_planted")
	print("Platform registered:", platform.name)

func _on_tree_planted(platform_node):
	print("Tree planted on platform:", platform_node.name)
