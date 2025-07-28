extends VBoxContainer

var userPath = OS.get_data_dir()
var mapsPath = userPath + "/SpinR/"
var button = load("res://Assets/Prefabs/MapButton.tscn")

func isSPRFile(file):
	if file.get_extension() == "spr":
		var instance = button.instantiate()
		instance.text = file.replace(".spr", "")
		$".".add_child(instance)

func _ready():
	var mapsList = DirAccess.get_files_at(mapsPath)
	var mapListArray = Array(mapsList)
	
	if mapListArray.filter(isSPRFile).size() > 1:
		$"../../NoMapsText".visible = true
	else:
		return

func backButtonPressed():
	get_tree().change_scene_to_file(Global.mainMenu)
