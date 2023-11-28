extends Node2D

onready var snowball = preload("res://Scene/Area/Snowball.tscn")

func _ready():
	randomize()
	

func _on_SignalTimer_timeout():
	var prob = randi() % 100
	if prob <= 20: 
		
		var temp_y = randi() % 640
		temp_y -= temp_y % 32
		
		var snow = snowball.instance()
		add_child(snow)
		snow.global_position = Vector2(1024, temp_y)

func _on_AvalancheTimer_timeout():
	for i in range(16, 640, 32):
		
		var temp_x = randi() % 256
		temp_x -= temp_x % 32
		
		var snow = snowball.instance()
		add_child(snow)
		snow.global_position = Vector2(1024 + temp_x, i)
