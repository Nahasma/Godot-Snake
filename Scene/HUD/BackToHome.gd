extends Button

func _on_BackToHome_pressed():
	get_tree().paused = false
	Global.back_to_title()
