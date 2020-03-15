extends Area2D


const SPEED = 400
var velocity = Vector2()

func _physics_process(delta):
	velocity.x = SPEED * delta
	translate(velocity)
	$AnimatedSprite.play("shoot")

func _ready():
	pass # Replace with function body.
	



func _on_Fireball_body_entered(body):
	if "Enemy" in body.name:
		body.dead() # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
