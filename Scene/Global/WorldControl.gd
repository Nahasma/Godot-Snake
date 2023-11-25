extends Node2D

#该字典作用为：存储世界位置
#方法依赖：go_to_world()
var world_dict = {
	"World1" : "res://Scene/world/World1.tscn",
	"World2" : "res://Scene/world/World2.tscn"
}

#该字典作用为：储存ui界面
#方法依赖：go_to_ui()
var ui_dict = {
	"Title"	: "res://Scene/UI/Title/TitleScene.tscn",
	"SelectTitle" : "res://Scene/UI/SelectTitle/SelectTitle.tscn"
}

func go_to_world(key):
	
	var path = world_dict[key]
	if path:
		get_tree().change_scene(path)
	else:
		get_tree().reload_current_scene()
	
func go_to_ui(key):
	
	var path = ui_dict[key]
	if path:
		get_tree().change_scene(path)
	else:
		get_tree().reload_current_scene()
