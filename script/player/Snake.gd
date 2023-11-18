extends Node2D

const snake_body =  preload("res://Scene/Snake/SnakeBody.tscn")

var pre_body = null
var next_body = null

#获取尾巴:递归
func get_tail(body):
	
	if body == null:
		return null
	elif body.next_body == null:
		return body
	
	return get_tail(body.next_body)

#生成尾巴
func add_body():
	call_deferred("do_add_body")

func init_tail():
	call_deferred("do_init_tail")
	
#初始化尾巴
func do_init_tail():
	var body = snake_body.instance()
	add_child(body)
	next_body = body
	var temp = get_node("SnakeHead")
	temp.next_body = body
	body.pre_body = temp
	body.global_position = Vector2(temp.global_position.x - 32, temp.global_position.y)
	body.next_position = temp.global_position
	body.shift_tail()
	body.ID = 1
	pass

#添加尾巴
func do_add_body():
	var body = snake_body.instance()
	add_child(body)
	var tail = get_tail(next_body)
	tail.next_body = body
	body.pre_body = tail
	body.global_position = tail.global_position
	body.next_position = tail.next_position
	tail.hide_body()
	body.shift_tail()
	body.frozen_time = tail.frozen_time + 1
	body.ID = tail.ID + 1

#死亡结算
func death():
	print("you died!")

#收集物结算
func collection_eaten():
	print("eaten!")

#接收到障碍物碰撞
func _on_SnakeHead_barrier_hit():
	death()

#接收到收集物碰撞
func _on_SnakeHead_collection_hit():
	add_body()
	collection_eaten()

