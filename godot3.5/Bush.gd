extends Sprite

signal hit_bush

func _on_Bush_Area2D_body_entered(body):
	emit_signal("hit_bush")
	print("You hit the bush!")
