extends Node2D

onready var animation = $AnimationPlayer
#火山是否爆发
var erupt: bool = false 

func _ready():
	randomize()
	get_node("Area2D").monitorable = false

func eruption():
	animation.play("eruption")
	get_node("EruTimer").start()

func recover():
	animation.play_backwards("eruption")
	get_node("RecTimer").start()

func _on_Timer_timeout():
	if erupt == false:
		var num = randi()%100
		if num <= 20:
			erupt = true
			eruption()
	else:
		var num = randi()%100
		if num <= 60:
			erupt = false 
			recover()

func _on_AniTimer_timeout():
	get_node("Area2D").monitorable = true

func _on_RecTimer_timeout():
	get_node("Area2D").monitorable = false
