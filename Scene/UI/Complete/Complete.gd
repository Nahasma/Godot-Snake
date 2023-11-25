extends Control

func _on_Try_pressed():
	Global.go_to_world("World1")

func _on_Home_pressed():
	Global.go_to_ui("Title")

func _on_Button_pressed():
	Global.go_to_world("Next")
