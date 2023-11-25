extends Control

#该段代码用于按钮按下后跳转到不同世界
func _on_World1_pressed():
	Global.go_to_world("World1")

func _on_World2_pressed():
	Global.go_to_world("World2")

func _on_World3_pressed():
	Global.go_to_world("World3")

func _on_world4_pressed():
	Global.go_to_world("World4")

func _on_world5_pressed():
	Global.go_to_world("World5")

func _on_world6_pressed():
	Global.go_to_world("World6")

#按下按钮后跳转主界面
func _on_TextureButton_pressed():
	Global.go_to_ui("Title")
