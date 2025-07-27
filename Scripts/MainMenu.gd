extends Control

func _on_debug_button_pressed():
	get_tree().change_scene_to_file("res://Prefabs/MapSelectionScreen.tscn")

func _on_map_maker_button_pressed():
	get_tree().change_scene_to_file("res://Prefabs/MapNamer.tscn")

func _on_practice_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Prefabs/PracticeMode.tscn")
