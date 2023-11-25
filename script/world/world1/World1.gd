extends Node2D

func _on_Snake_death():
	get_tree().paused = true
	get_node("Failure").visible = true
	pass # Replace with function body.
