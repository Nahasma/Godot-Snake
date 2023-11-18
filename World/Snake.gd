extends Area2D

func _ready():
	input_pickable = true
	collision_layer = 1
	
func _process(delta):
	if Input.is_action_just_pressed("click") and get_direction() == true:
		emit_signal("mouse_entered")	
	else:
		emit_signal("mouse_exited")
	
func get_direction() -> bool:
	var d = get_global_mouse_position() - global_position 
	if d.length() < 50:
		return true
	else:
		return false 
		
func _on_Snake_mouse_entered():
	print("111")

