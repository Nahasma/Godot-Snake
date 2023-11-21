extends PathFollow2D

var move_speed = 60 / 256.06
var direction = 0
var unit = 0

func _ready():
	offset = 0
	
func _process(delta):
	
	unit += move_speed * delta * direction
	if unit > 1:
		unit = 1
		direction = 0
		
	elif unit < 0:
		unit = 0
		direction = 0
		
	unit_offset = unit
	
#当收到信号时，触发移动
func _on_SnakeNode_Run():
	direction = 1

func _on_Snake_mouse_exited():
	direction = -1
