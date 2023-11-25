extends Area2D


#当蛇头进入后隐藏苹果
func _on_AppleArea_area_entered(_area):
	visible = false
