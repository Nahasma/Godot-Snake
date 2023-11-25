extends Control

onready var animation = get_node("UI/TextureRect/AnimationPlayer")
#准备游戏
func _ready():
	update_button()
	pass
		
#开始游戏
func _on_START_pressed():
	Global.go_to_ui("SelectTitle")

#退出游戏
func _on_QUIT_pressed():
	get_tree().quit()

func update_button():
	pass

