extends Node2D

func _ready():
	$ColorRect/TextureButton.grab_focus()

func _physics_process(delta):
	if $ColorRect/TextureButton.is_hovered() == true:
		$ColorRect/TextureButton.grab_focus()
		
	if $ColorRect/TextureButton2.is_hovered() == true:
		$ColorRect/TextureButton2.grab_focus()

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Game.tscn")
