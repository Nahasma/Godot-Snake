extends Node2D

func _on_Timer_timeout():
	if Global.score >= 1:
		get_node("Timer").stop()
		get_node("Sprite/island2D").monitorable = false
		get_node("Sprite/island2D").monitoring = false
	print(get_node("Sprite/island2D").monitorable)


func _on_Area2D_area_entered(area):
	print("able:",get_node("Sprite/island2D").monitorable," enter:",area.name)
