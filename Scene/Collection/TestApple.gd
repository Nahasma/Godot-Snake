#该节点作用为提前生成下一个苹果位置，避免苹果出现在非法区域

extends Area2D

func _ready():
	TestApple_Create()
	
func TestApple_Create():
	global_position = random_create()
	
func random_create():
	randomize()
	var temp_position = Vector2(randi() * 32 % (512 - 32), randi() * 32 % (512 - 32))
	return temp_position
	
func _on_TestApple_area_entered(_area):
	print("come on")
	TestApple_Create()
