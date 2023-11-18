extends PathFollow2D

var move_speed = 1
var direction = 0

func _process(delta):
	offset += move_speed * delta * direction
	
#当收到信号时，触发移动
func _on_SnakeNode_Run():
	print("yes")
	direction = 1

func _on_Snake_mouse_exited():
	print("no")
	direction = -1
