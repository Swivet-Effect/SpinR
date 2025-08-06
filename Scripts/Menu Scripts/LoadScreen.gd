extends Control

func _on_timer_timeout():
	match Global.destination:
		"MapRun":
			get_tree().change_scene_to_file(Global.mapRunner)
		"Practice":
			get_tree().change_scene_to_file(Global.practiceMode)
		"Selection":
			get_tree().change_scene_to_file(Global.mapSelection)
		"Menu":
			get_tree().change_scene_to_file(Global.mainMenu)
		"Completion":
			get_tree().change_scene_to_file(Global.completionScreen)
		"Editor":
			get_tree().change_scene_to_file(Global.editorScreen)
		_:
			pass
