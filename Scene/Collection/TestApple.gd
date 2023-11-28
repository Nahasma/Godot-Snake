#该节点作用为提前生成下一个苹果位置，避免苹果出现在非法区域

extends Area2D
onready var mode

func _ready():
	var cur = Global.current_level
	if cur == 6:
		mode = 1
		
	if mode == 1:
		special_create()
	else:
		TestApple_Create()
	
func TestApple_Create():
	global_position = random_create()
	
func random_create():
	randomize()
	var temp_position = Vector2(randi() * 32 % 1024, randi() * 32 % 600)
	return temp_position
	
func _on_TestApple_area_entered(_area):
	if mode == 1:
		special_create()
	else:
		TestApple_Create()

func special_random():
	
	var temp_x = randi() * 32 % 380
	var temp_deg = randi() % 22
	var temp_y = int(temp_x * tan(deg2rad(temp_deg)))
	temp_y -= temp_y % 32 
	return Vector2(temp_x, temp_y)

func special_create():
	global_position = special_random()
