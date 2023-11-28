extends Control

onready var animation = get_node("UI/TextureRect/AnimationPlayer")
onready var score_1 = $DataUI/VBoxContainer/GridContainer/score
onready var score_2 = $DataUI/VBoxContainer/GridContainer/score2
onready var score_3 = $DataUI/VBoxContainer/GridContainer/score3
onready var score_4 = $DataUI/VBoxContainer/GridContainer/score4
onready var score_5 = $DataUI/VBoxContainer/GridContainer/score5

#开始游戏
func _on_START_pressed():
	Global.go_to_ui("SelectTitle")

#退出游戏
func _on_QUIT_pressed():
	get_tree().quit()

#调出历史数据
func _on_DATA_pressed():
	history_fresh()
	get_node("DataUI").visible = true

#退出历史数据
func _on_Back_pressed():
	get_node("DataUI").visible = false 

#刷新历史数据
func history_fresh():
	var temp = Global.history
	score_1.text = str(temp[1])
	score_2.text = str(temp[2])
	score_3.text = str(temp[3])
	score_4.text = str(temp[4])
	score_5.text = str(temp[5])
