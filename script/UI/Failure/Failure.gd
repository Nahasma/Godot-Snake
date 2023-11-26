extends Control

onready var Snake = $"../Main/Snake"
onready var Score = $VBoxContainer/GridContainer/CollectionNum
onready var Death = $VBoxContainer/GridContainer/DeathTime

func _ready():
	init_connect()
	
#初始化信号链接
func init_connect():
	Snake.connect("death", self, "_on_Snake_death")
	
func _on_Try_pressed():
	Global.reset(1)
	Global.add_death()
	Global.go_to_world(Global.current_level_str)

func _on_Home_pressed():
	Global.reset(0)
	Global.go_to_ui("Title")

#初始化文本
func init_text():
	Score.text = str(Global.score)
	Death.text = str(Global.death_time)
	
#调出死亡动画
func _on_Snake_death():
	get_tree().paused = true
	init_text()
	visible = true
	

