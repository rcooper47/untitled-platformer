extends Node2D


func _on_start_button_button_up():
	get_tree().change_scene_to_file("res://level.tscn")
