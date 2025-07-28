extends Control

func QuitButtonPressed():
	get_tree().quit()

func OptionsButtonPressed():
	get_tree().change_scene_to_file(Global.optionsMenu)

func PlayButtonPressed():
	get_tree().change_scene_to_file(Global.mapSelection)

func MapMakerButtonPressed():
	get_tree().change_scene_to_file(Global.mapNamer)

func PracticeButtonPressed():
	get_tree().change_scene_to_file(Global.practiceMode)
