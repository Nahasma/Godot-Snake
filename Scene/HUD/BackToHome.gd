extends Button

func _on_BackToHome_pressed():
	get_tree().paused = false
	Global.go_to_ui("Title")
