extends Area2D

export var score: = 100

func _on_body_entered(body: KinematicBody2D ) -> void:
	picked()
	
func picked() -> void:
	queue_free()
	PlayerData.score += score
