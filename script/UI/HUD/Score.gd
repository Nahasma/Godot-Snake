extends Label

func _ready():
	_on_score_change()
	Global.connect("score_change", self, "_on_score_change")

func _on_score_change():
	text = str(Global.score)
