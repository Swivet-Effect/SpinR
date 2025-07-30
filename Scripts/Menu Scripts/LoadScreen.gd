extends Control

func _on_timer_timeout():
	match Global.destination:
		"MapRun":
			get_tree().change_scene_to_file(Global.mapRunner)
		"Practice":
			get_tree().change_scene_to_file(Global.practiceMode)
		_:
			pass
