extends Control

func QuitButtonPressed():
	get_tree().quit()

func OptionsButtonPressed():
	get_tree().change_scene_to_file(Global.optionsMenu)

func PlayButtonPressed():
	Global.destination = "MapRun"
	Global.isPractice = false
	get_tree().change_scene_to_file(Global.mapSelection)

func MapMakerButtonPressed():
	get_tree().change_scene_to_file(Global.mapNamer)

func PracticeButtonPressed():
	Global.destination = "Practice"
	Global.isPractice = true
	get_tree().change_scene_to_file(Global.loadScreen)

func MapEditorButton():
	Global.destination = "Editor"
	get_tree().change_scene_to_file(Global.mapSelection)
