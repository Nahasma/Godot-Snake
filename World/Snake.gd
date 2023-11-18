extends Area2D

func _ready():
	input_pickable = true
	collision_layer = 1
	
func _on_Snake_mouse_entered():
	print("111")

