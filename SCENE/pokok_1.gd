extends Sprite2D

func show_img():
	self.visible=true 

func hide_img():
	self.visible=false 


func _on_flower_1_btn_pressed() :
	show_img()
	print("Clicked1")
