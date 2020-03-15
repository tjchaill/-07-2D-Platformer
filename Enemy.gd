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
# warning-ignore:standalone_expression
	is_dead == true
	motion = Vector2(0, 0)
	$CollisionShape2D.queue_free()
	
	
# warning-ignore:unused_argument
func _physics_process(delta):
	
	if is_dead == false:
		
		$AnimatedSprite.play("WALKING")
		
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		
		motion.x = speed * direction
		
		motion.y += gravity
		
		motion = move_and_slide(motion, UP)
		
		
		
	
		if is_on_wall():
			direction = direction* -1




