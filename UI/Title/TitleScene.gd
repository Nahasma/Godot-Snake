extends Control


#准备游戏
func _ready():
	update_button()
	print("yes")
	pass
		
#开始游戏
func _on_START_pressed():
	Global.start_game()

#退出游戏
func _on_QUIT_pressed():
	get_tree().quit()

func update_button():
	pass

