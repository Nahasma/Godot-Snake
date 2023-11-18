extends Control

onready var animate = get_node("AnimatedSprite")

func _on_Continue_ticker(now_time:int):
	animate.frame = now_time

func _on_Continue_pause_end():
	visible = true

func _on_Continue_off_ticker():
	visible = false
