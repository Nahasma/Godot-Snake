extends Button

func _on_Retry_pressed():
	get_tree().paused = false
	Global.reset(1)
	Global.go_to_world(Global.current_level_str)
