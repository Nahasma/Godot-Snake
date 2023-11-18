extends TileMap

signal hit_cliff


func _on_Cliff_Area2D_body_entered(body):
	emit_signal("hit_cliff")
	print("You hit the cliff!")
