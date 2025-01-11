extends StaticBody2D 
 

@onready var grow_animation = $grow

var seed = Global.seedselected
var planted_tree = false
var plant_grown = false

func _physics_process(delta):
	if planted_tree == false:
		seed = Global.seedselected

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if not planted_tree:
		planted_tree = true
		grow_animation.play("growing1") 
		Global.canopypoint += 6
	else:
		grow_animation.play("default")
		print("plant = global???")
		print(Global.canopypoint)
		print("seed:" + str(seed) + " entered platform's shape")

func _trigger_seed_plant_animation():
	if not planted_tree:
		planted_tree = true
		grow_animation.play("growing1")
		Global.canopypoint += 6
		print($grow)


func _on_tanam_pressed() -> void:
	if not planted_tree:
		planted_tree = true
		grow_animation.play("growing1")
		
		$Timer1.start()
		print($grow)
	elif plant_grown:
		plant_grown = false
		$grow.play("default")
	#after harvest


func _on_timer_1_timeout() -> void:
	grow_animation.play("growing2")
	$Timer2.start()
	print("timeout1")

func _on_timer_2_timeout() -> void:
	grow_animation.play("growing3")
	$Timer3.start()
	print("timeout2")

func _on_timer_3_timeout() -> void:
	print("timeout3")
	grow_animation.play("grown")
	plant_grown = true
