extends Node2D

onready var animation = $AnimationPlayer

var arouse: bool = false 
var last_move_direction:bool = false 


#移动
func move(pos:Vector2):
	if pos.x > global_position.x:
		move_right()

	elif pos.x < global_position.x:
		move_left()

	else:
		pass
		
func move_left():
	animation.play("move_left")
	last_move_direction = false 
	var test_pos = position.x - 16
	test_pos = clamp(test_pos, 0, get_viewport_rect().size.x)
	position.x = test_pos
	animation.play_backwards("move_left")
	pass


func move_right():
	animation.play("move_right")
	last_move_direction = true 
	var test_pos = position.x + 16
	test_pos = clamp(test_pos, 0, get_viewport_rect().size.x)
	position.x = test_pos
	animation.play_backwards("move_right")
	pass

#攻击范围判定
func _on_Detectbox_area_entered(area):
	if area.is_in_group("head"):
		if arouse == true:
			move(area.global_position)
			
		else:
			animation.play("arouse")
			arouse = true

#判断碰撞蛇身
func _on_Hitbox_area_entered(area):

	if area.is_in_group("barrier") or area.is_in_group("body"):
		if last_move_direction == false:
			animation.play("move_left")
			animation.play_backwards("move_left")

		if last_move_direction == true:
			animation.play("move_right")
			animation.play_backwards("move_right")

		get_node("AniTimer").start()
		
func _on_AniTimer_timeout():
	animation.play("death")
	get_node("DeathTimer").start()

func _on_DeathTimer_timeout():
	queue_free()

