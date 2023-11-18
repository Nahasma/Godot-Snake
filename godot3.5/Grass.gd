extends Sprite

signal hit_grass

func _on_Grass_Area2D_body_entered(body):
	emit_signal("hit_grass")
	print("You hit the grass!")
