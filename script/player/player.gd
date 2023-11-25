extends Area2D

var snake_direction: Vector2 = Vector2.ZERO
var true_direction: Vector2 = Vector2.ZERO
var time_count:int = 0
var speed_time:int = 20
 
var pre_body = null
var next_body = null
var temp_position = null

signal collection_hit
signal barrier_hit

func _ready():
	get_parent().init_tail()
	
#进程
func _physics_process(_delta):
	snake_move()
	
#蛇头移动
func snake_move():
	snake_direction = direction_shift()
	time_count += 1
	if time_count >= speed_time:
		true_direction = snake_direction
		temp_position = global_position
		global_position += snake_direction * 32
		texture_shift(snake_direction)
		time_count = 0
		if(next_body != null and snake_direction.length() != 0):
			next_body.update()

#切换蛇头实际方向
func direction_shift():
	
	#接收外部信号，转换为Vector2
	var input_vector = Vector2.ZERO
	input_vector.x=Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	input_vector.y=Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	
	#如果没有则维持原方向
	if input_vector == Vector2.ZERO:
		return snake_direction
	
	#分量大者优先	
	if abs(input_vector.x) > abs(input_vector.y):
		input_vector.y = 0
	else:
		input_vector.x = 0
		
	input_vector = input_vector.normalized()
	
	if input_vector == -1 * true_direction:
		return true_direction
	else:
		return input_vector

#切换蛇头显示朝向
func texture_shift(val):
	if val.x == -1:
		get_node("AnimatedSprite").frame = 1
		
	elif val.x == 1:
		get_node("AnimatedSprite").frame = 2
		
	elif val.y == -1:
		get_node("AnimatedSprite").frame = 3
		
	elif val.y == 1:
		get_node("AnimatedSprite").frame = 0

#碰撞检测
func _on_SnakeHead_area_entered(area):
	#收集物检测
	if area.is_in_group("collection") == true:
		emit_signal("collection_hit")
	
	#障碍物检测	
	elif area.is_in_group("Testapple") == true:
		print("testapple")
		pass
		
	else:
		emit_signal("barrier_hit")

	
