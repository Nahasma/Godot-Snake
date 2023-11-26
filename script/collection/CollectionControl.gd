extends Node2D

signal check 

func _on_Apple_check_pass():
	emit_signal("check")
