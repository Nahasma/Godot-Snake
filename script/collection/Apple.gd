#该节点作用为生成苹果，并在被吃掉后重新生成在新位置

extends Area2D

onready var apple_frame = get_node("apple_frame")

var egg = 0

signal check_pass

func Apple_Create():
	global_position = get_parent().get_node("TestApple").global_position
	
func _ready():
	
	if Global.current_level != 6:
		global_position = Vector2(512,320)
		
	else:
		egg = 1
		apple_frame.frame = 1
		global_position = Vector2(32, 32)

#当区域进入后（其实是蛇头），重置位置
func _on_Apple_area_entered(area):
	if area.is_in_group("Testapple") == false and area.is_in_group("door") == false and area.is_in_group("enemy") == false:	
		apple_frame.frame = 2
		get_node("Timer").start()
		set_deferred("monitorable", false)
		if area.is_in_group("head"):
			if egg == 0:
				add_score(1)
			elif egg == 1:
				add_score(15)

#加分
func add_score(myscore:int):
	Global.score += myscore
	Global.change_score()
	emit_signal("check_pass")


func _on_Timer_timeout():
	set_deferred("monitorable", true)
	Apple_Create()
	apple_frame.frame = egg
