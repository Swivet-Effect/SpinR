extends Control

func _on_debug_button_pressed():
	get_tree().change_scene_to_file(Global.mapSelection)

func _on_map_maker_button_pressed():
	get_tree().change_scene_to_file(Global.mapNamer)

func _on_practice_button_pressed():
	get_tree().change_scene_to_file(Global.practiceMode)
