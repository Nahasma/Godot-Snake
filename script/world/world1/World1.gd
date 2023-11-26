extends Node2D

var pass_score = Global.pass_score[1]
var pass_flag = false

signal create_door

#调出死亡动画
func _on_Snake_death():
	get_tree().paused = true
	get_node("Failure").visible = true

#判断是否达到过关条件
func _on_Collection_check():
	if pass_flag == false and Global.score >= pass_score:
		create_pass_door()

#创造通关门
func create_pass_door():
	emit_signal("create_door")
