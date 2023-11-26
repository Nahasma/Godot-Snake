extends Node2D

var started_at: int = OS.get_unix_time()
var completed_at: int = OS.get_unix_time()
var time = 0
signal score_change

#存放过关要求
var pass_score = [0, 1, 1, 1, 1, 1, 1]

#存放当前分数
var score = 0
var death_time = 0

#存放当前关卡
var current_level = 0
var current_level_str 

#字典存放关卡与对应的int值
var level_dict = {
	"World1":1,
	"World2":2,
	"World3":3,
	"World4":4,
	"World5":5,
	"World6":6,
	"World7":7
}

var level_str_dict = {
	1:"World1",
	2:"World2",
	3:"World3",
	4:"World4",
	5:"World5",
	6:"World6",
	7:"World7",
}


#前往关卡
func go_to_world(key):
	init_new_level(key)
	get_node("WorldControl").go_to_world(level_str_dict[current_level])

#前往ui界面
func go_to_ui(key):
	get_tree().paused = false
	get_node("WorldControl").go_to_ui(key)

#进入关卡前的初始化
func init_new_level(key):
	if key == "Next":
		current_level += 1
	else:
		current_level = level_dict[key]
	current_level_str = level_str_dict[current_level]
	get_tree().paused = false

#改变显示当前的score
func change_score():
	emit_signal("score_change")

#重置数据
func reset(mode:int):
	
	#通关的刷新方式
	if(mode == 0):
		score = 0
		death_time = 0
		started_at = OS.get_unix_time()
		completed_at = OS.get_unix_time()
		time = 0
	
	#输了再来的刷新方式
	if(mode == 1):
		score = 0
		time = 0
	
	pass

func time_write():
	
	completed_at = OS.get_unix_time()
	time = completed_at - started_at

func add_death():
	
	death_time += 1
