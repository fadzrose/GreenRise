extends StaticBody2D

var plant = Global.treeselected
var planted_tree = false
#var droped = Global.selectedDropped

func _ready():
	pass

func _physics_process(delta):
	if planted_tree == false:
		plant = Global.treeselected
		


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	
		if not planted_tree:
			planted_tree = true
			if plant == 1:
				$tree.play("tree1")
			elif plant == 2:
				$tree.play("tree2")
			
			elif plant == 3:
				$tree.play("tree3")
			elif plant == 4:
				$tree.play("tree4")
			elif plant == 5:
				$tree.play("tree5")
			elif plant == 6:
				$tree.play("tree6")
			elif plant == 7:
				$tree.play("tree7")
			else:
				$tree.play("default")
				print("plant = global???")
			
			print("tree:"+ str(plant) +"entered platform's shape")
			
