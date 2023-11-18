extends Node2D

signal Run

func _on_Snake_mouse_entered():
	emit_signal("Run")

