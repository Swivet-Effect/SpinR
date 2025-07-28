extends Control

func BackButtonPressed():
	get_tree().change_scene_to_file(Global.mainMenu)

func InputMethodChanged(index):
	if index == 0:
		Global.inputType = "mouse"
	elif index == 1:
		Global.inputType = "controller"
	else:
		Global.inputType = "mouse"
