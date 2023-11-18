extends Node2D

var pre_body = null
var next_body = null
var temp_position = null
var next_position = null
var frozen_time = 0
var ID = 0

signal fail

#更新位置
func update():
	
	if frozen_time == 0:
		temp_position = global_position
		global_position = next_position
		next_position = pre_body.global_position
		
		#如果有下个节点则更新下个节点
		if next_body != null:
			shift_body()
			next_body.update()
		
		#没有下一个节点即是尾巴	
		else:
			shift_tail()
	
	else:
		frozen_time -= 1
		
		if next_body != null:
			next_body.update()	
	
#更新尾巴图片
func shift_tail():
	
	if global_position.x < next_position.x:
		get_node("AnimatedSprite").frame = 8
		
	elif global_position.x > next_position.x:
		get_node("AnimatedSprite").frame = 7
		
	elif global_position.y < next_position.y:
		get_node("AnimatedSprite").frame = 6
		
	elif global_position.y > next_position.y:
		get_node("AnimatedSprite").frame = 9
		
#更新身体图片
func shift_body():

	var _x = global_position.x
	var _y = global_position.y
	var x_pre = temp_position.x
	var y_pre = temp_position.y
	var x_nxt = next_position.x
	var y_nxt = next_position.y
	
	if x_pre == x_nxt:
		get_node("AnimatedSprite").frame = 1
		
	elif y_pre == y_nxt:
		get_node("AnimatedSprite").frame = 0
		
	elif (x_pre - x_nxt) * (y_pre - y_nxt) > 0:
		if _y < y_nxt or _y < y_pre:
			get_node("AnimatedSprite").frame = 2
		else:
			get_node("AnimatedSprite").frame = 5
		
	else:
		if _y < y_nxt or _y < y_pre:
			get_node("AnimatedSprite").frame = 3
		else:
			get_node("AnimatedSprite").frame = 4
	
func hide_body():
	get_node("AnimatedSprite").frame = 10



func _on_Area2D_body_shape_entered(_body_rid, body):
	print(body.name)
	if body.is_in_group("head"):
		emit_signal("fail")
		print("fail!")
