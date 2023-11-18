extends Button

signal pause_end
signal ticker
signal off_ticker

onready var clock = get_node("ContinueClock")

#time_check: 检查是否到点了
#set_time: 设置的暂停时长
#now_time: 现在的时间
var timer_check:int = 0
var set_time = 3

func _input(event):
	
	if event.is_action_pressed("pause"):
		continue_game()

#继续游戏
#切换可视状态
#进行倒计时，结束后开始游戏
func continue_game():
	
	get_parent().visible = false
	emit_signal("pause_end")
	clock_count()

#计时器
#从set_time开始计时，计时的时候Clock会在界面显示剩余时间
#计时结束后游戏开始，Clock隐藏
func clock_count():
	
	timer_check = set_time
	emit_signal("ticker",set_time)
	clock.start()
	
func _on_Continue_pressed():
	
	continue_game()
	
func _on_ContinueClock_timeout():
	
	timer_check -= 1
	emit_signal("ticker",timer_check)
	if timer_check == 0:
		clock.stop()
		emit_signal("off_ticker")
		get_tree().paused = false
	
	
