extends Node2D

func _ready():
	var hjn := RandomNumberGenerator.new()
	
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = hjn.randi_range(0, width)
	var y = 0 
	position = Vector2(random_x, y)

func _process(delta):
	position += Vector2(0, 1.0) * 400 * delta
