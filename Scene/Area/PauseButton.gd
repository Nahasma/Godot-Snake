extends Button

signal pause_start

func _input(event):
	if event.is_action_pressed("pause"):
		pause_game()
		
func _on_PauseButton_pressed():
	pause_game()
	
func pause_game():
	get_tree().paused = true
	get_parent().visible = false
	emit_signal("pause_start")



