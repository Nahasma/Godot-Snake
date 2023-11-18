#该节点作用为生成苹果，并在被吃掉后重新生成在新位置

extends Area2D

onready var apple_frame = get_node("apple_frame")

func Apple_Create():
	global_position = get_parent().get_node("TestApple").global_position
	
func _ready():
	Apple_Create()

#当区域进入后（其实是蛇头），重置位置
func _on_Apple_area_entered(area):
	if area.is_in_group("Testapple") == false:	
		Apple_Create()


