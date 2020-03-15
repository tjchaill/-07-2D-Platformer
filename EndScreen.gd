extends Control

onready var label: Label = get_node("Label:")


func _ready() -> void:
	label.text = label.text % PlayerData.deaths


func _on_Play_pressed():
	get_tree().change_scene("res://TitleScreen.tscn") # Replace with function body.
