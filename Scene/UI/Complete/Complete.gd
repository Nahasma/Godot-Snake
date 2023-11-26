extends Control

onready var Control = $"../Control"
onready var Score = $VBoxContainer/GridContainer/CollectionNum
onready var Death = $VBoxContainer/GridContainer/DeathTime
onready var TimeUse = $VBoxContainer/GridContainer/Time

signal refresh

func _ready():
	init_connect()

#初始化信号链接
func init_connect():
	Control.connect("complete", self, "_on_Control_complete")
	
func _on_Try_pressed():
	Global.reset(0)
	var now_world = Global.current_level_str
	Global.go_to_world(now_world)

func _on_Home_pressed():
	Global.reset(0)
	Global.go_to_ui("Title")

func _on_Button_pressed():
	Global.reset(0)
	Global.go_to_world("Next")

#初始化文本:分数，死亡次数，时间
func init_text():
	var complete_time = Global.time
	var minute = complete_time / 60
	var second = complete_time % 60
	Score.text = str(Global.score)
	Death.text = str(Global.death_time)
	TimeUse.text = "%d:%02d" % [minute, second]

func _on_Control_complete():
	get_tree().paused = true
	Global.time_write()
	init_text()
	self.visible = true

