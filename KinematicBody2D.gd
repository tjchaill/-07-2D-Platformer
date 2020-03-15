extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
export var gravity = 10
export var jump_force = -400
export var speed = 200

const FIREBALL = preload("res://Fireball.tscn")

var is_dead = false

func _physics_process(delta):
	
	if is_dead == false:
		
		motion.y += gravity
		if Input.is_action_pressed("ui_right"):
			motion.x = speed
			
		elif Input.is_action_pressed("ui_left"):
			motion.x = -speed
			
		else: 
			motion.x = 0
			
		if is_on_floor():
			if Input.is_action_just_pressed("ui_up"):
				motion.y = jump_force
				
		if Input.is_action_just_pressed("ui_focus_next"):
			var fireball = FIREBALL.instance()
			get_parent().add_child(fireball)
			fireball.position = $Position2D.global_position
				
		motion = move_and_slide(motion, UP)
		
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Enemy" in get_slide_collision(i).collider.name:
					dead()
		
func dead():
	is_dead = true
	motion = Vector2(0,0)
	#$CollisionShape2D.disable = true
	$Timer.start()
	PlayerData.deaths += 1

func _on_Timer_timeout():
	get_tree().change_scene("res://Game.tscn")
	#get_tree().change_scene("TitleScreen.tscn")
	



