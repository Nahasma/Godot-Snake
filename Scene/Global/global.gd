extends Node2D

var started_at: int = OS.get_unix_time()

func go_to_world(key):
	get_tree().paused = false
	get_node("WorldControl").go_to_world(key)

func go_to_ui(key):
	get_tree().paused = false
	get_node("WorldControl").go_to_ui(key)
