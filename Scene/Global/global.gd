extends Node2D

func back_to_title():
	_animate_transition_to("res://UI/TitleScene.tscn")

func _animate_transition_to(path):
#	animation_player.play_backwards("fade-in")
#	yield(animation_player, "animation_finished")
	
	if path:
		get_tree().change_scene(path)
	else:
		get_tree().reload_current_scene()
	
#	animation_player.play("fade-in")	
