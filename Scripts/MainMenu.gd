extends Control

func _on_debug_button_pressed():
	get_tree().change_scene_to_file("res://Prefabs/LoadScreen.tscn")


func _on_map_maker_button_pressed():
	get_tree().change_scene_to_file("res://Prefabs/MapNamer.tscn")
