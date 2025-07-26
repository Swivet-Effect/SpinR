extends Button

func _on_pressed() -> void:
	Global.mapTitle = $".".text
	get_tree().change_scene_to_file("res://Prefabs/debug_track.tscn")
