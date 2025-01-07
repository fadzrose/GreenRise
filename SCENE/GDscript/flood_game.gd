extends Control

@onready var _info_panel: Control= $infoPanel

func _ready():
	$infoPanel.hide()
	$timeoutPopup.hide()
	$FloodTimer.start()
	$AnimationTimer.play("timer")
	$"%level1".hide()
	$"%level2".hide()
	$"%level3".hide()
	$"%level4".hide()
	$awan.hide()
	$rainAnim.hide()
	$rainAnim2.animation = "default" 
	$rainAnim2.hide()
	$rainAnim3.animation = "default" 
	$rainAnim3.hide()
	$rainAnim4.animation = "default" 
	$rainAnim4.hide()
	$rainAnim5.animation = "default" 
	$rainAnim5.hide()
	$rainAnim.animation = "default" 
	



func _on_btn_info_pressed() -> void:
	$infoPanel.show()
	_info_panel.get_node("Button").connect("pressed", _back_btn_pressed)

func _back_btn_pressed():
	$infoPanel.hide()
	


func _on_flood_timer_timeout() -> void:
	print("timeout")
	$timeoutPopup.show()
	$timeroutPopup.start()


func _on_timerout_popup_timeout() -> void:
	$timeoutPopup.hide()
	$Panel.hide()
	$tree1.hide()
	$tree2.hide()
	$tree3.hide()
	$tree4.hide()
	$tree5.hide()
	$tree6.hide()
	$tree7.hide()
	$AnimationTimer.play("flood")
	$heavyRain.play()
	$awan.show()  
	$rainAnim.show()
	$rainAnim5.show()
	$rainAnim2.show()
	$rainAnim3.show()
	$rainAnim4.show()
	$rainAnim.play()
	$rainAnim5.play()
	$rainAnim2.play()
	$rainAnim3.play()
	$rainAnim4.play()
	
