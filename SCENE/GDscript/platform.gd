extends StaticBody2D

var flood_game_scene
var plant = Global.treeselected
var planted_tree = false
#var droped = Global.selectedDropped

func _ready():
	flood_game_scene = Global.flood_game_instance
	if flood_game_scene == null:
		print("FloodGame instance not found in Global!")
	else:
		print("FloodGame instance successfully referenced.")


func _on_flood_game_added(flood_game_instance):
	flood_game_scene = flood_game_instance
	print("FloodGame instance received:", flood_game_scene)

func _physics_process(delta):
	if planted_tree == false:
		plant = Global.treeselected
		


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	
		if not planted_tree:
			planted_tree = true
			if plant == 1:
				$tree.play("tree1")
				Global.canopypoint += 6
				
			elif plant == 2:
				$tree.play("tree2")
				Global.canopypoint += 9
				
			elif plant == 3:
				$tree.play("tree3")
				Global.canopypoint += 3
				
			elif plant == 4:
				$tree.play("tree4")
				Global.canopypoint += 7
				
			elif plant == 5:
				$tree.play("tree5")
				Global.canopypoint += 8
				
			elif plant == 6:
				$tree.play("tree6")
				Global.canopypoint += 4
			elif plant == 7:
				$tree.play("tree7")
				Global.canopypoint += 5
			else:
				$tree.play("default")
				print("plant = global???")
			
			print(Global.canopypoint)
			print("tree:"+ str(plant) +"entered platform's shape")
			
			flood_game_scene = Global.flood_game_instance
			if flood_game_scene:
				flood_game_scene.update_thermometer()  # Call the method directly
			else:
				print("Error: flood_game_scene is null!")
			print("Global.flood_game_instance at start:", Global.flood_game_instance)
