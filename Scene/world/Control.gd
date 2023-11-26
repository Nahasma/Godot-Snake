extends Node2D

onready var Collection = $"../Main/Collection"

#pass_score:通关条件
#pass_flag：创造door的条件
#pass_flag：已经创造了door
var pass_score = Global.pass_score[1]
var pass_flag = false
var pass_true_flag = false

var in_predoor = 0

signal create_door
signal complete

func _ready():
	init_door()
	init_connect()
	pass_score = Global.pass_score[1]

#初始化信号链接
func init_connect():
	Collection.connect("check", self, "_on_Collection_check")

#初始化
func init_door():
	global_position = Vector2(512,320)
	get_node("door").visible = false
	get_node("predoor").visible = true
	pass_flag = false
	pass_true_flag = false
	in_predoor = 0

#判断是否达到过关条件
func _on_Collection_check():
	if pass_flag == false and Global.score >= pass_score and in_predoor == 0:
		pass_flag = true
		create_pass_door()

#创造通关门
func create_pass_door():
	pass_true_flag = true
	get_node("door").visible = true
	get_node("predoor").visible = false 

#避免在蛇经过时生成
#当检测到有蛇身/头进入时
func _on_Area2D_area_entered(area):
	if area.is_in_group("snake") == true:
		in_predoor += 1

#当检测到有蛇身/头离开时
func _on_Area2D_area_exited(area):
	if area.is_in_group("snake") == true:
		in_predoor -= 1
		_on_Collection_check()

#当检测到蛇头进入后通关
func _on_door_area_entered(area):
	if area.is_in_group("head") == true and pass_true_flag == true:
		emit_signal("complete")
	
