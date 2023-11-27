extends KinematicBody2D

onready var animation = $AnimationPlayer

const MAX_SPEED = 400
const ACC = 1
const left = Vector2(-1, 0)
var velocity = Vector2(0, 0) 

func _process(delta):
	animation.play("roll")
	velocity += left * ACC * delta
	velocity = velocity.clamped(MAX_SPEED * delta)
	move_and_collide(velocity)
	pass

func _on_Area2D_area_entered(area):
	print(area)
	if area.is_in_group("barrier") == true and area.is_in_group("right_border") == false:
		snow_break()
		
	elif area.is_in_group("body") == true:
		snow_break()

#碰到物体后碎裂
func snow_break():
	set_process(false)
	get_node("BreakTimer").start()
	animation.play("break")

func _on_BreakTimer_timeout():
	queue_free()
