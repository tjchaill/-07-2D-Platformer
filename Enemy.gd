extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
export var gravity = 10
export var jump_force = -400
export var speed = 100

var direction = 1

var is_dead = false

func _ready():
	pass 
	
func dead():
	is_dead == true
	motion = Vector2(0, 0)
	$AnimatedSprite.play("dead")
	$CollisionShape2D.queue_free()
	
	
func _physics_process(delta):
	
	if is_dead == false:
		
		motion.x = speed * direction
		
		motion.y += gravity
		
		motion = move_and_slide(motion, UP)
	
		if is_on_wall():
			direction = direction* -1




