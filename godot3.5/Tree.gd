extends Sprite

signal hit_tree


func _on_Tree_Area2D_body_entered(body):
	emit_signal("hit_tree")
	print("You hit the tree!")
