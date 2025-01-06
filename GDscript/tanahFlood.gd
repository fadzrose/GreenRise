extends StaticBody2D

# Place the tree on the platform
var tree = -1
var tree_planted = false



signal tree_dropped(tree_type)

func _on_tree_dropped(tree_type):
	print("Tree of type", tree_type, "planted on platform.")
	# Add logic for playing animations or updating the platform state


func _ready():
	# Ensure the tree sprite is hidden initially
	$tree.visible = false


func _physics_process(delta):
	print(Global.treeselected)  # Debugging selected tree type
	if not tree_planted:
		tree = Global.treeselected  # Continuously update the selected tree if not planted


func _on_area_2d_area_entered(area):
	print("Area2D entered.")  # Debug message
	if not tree_planted:
		tree = Global.treeselected  
		
		tree_planted = true  # Mark the tree as planted
		print("Planting tree:", tree)  # Debug message
		$tree.visible = true  # Make the tree sprite visible

		# Play the correct animation based on the selected tree type
		match tree:
			1:
				$tree.play("tree1")
			2:
				$tree.play("tree2")
			3:
				$tree.play("tree3")
			4:
				$tree.play("tree4")
			5:
				$tree.play("tree5")
			6:
				$tree.play("tree6")
			7:
				$tree.play("tree7")
	else:
		print("Tree already placed here.")
