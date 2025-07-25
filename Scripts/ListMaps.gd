extends VBoxContainer

var userPath = OS.get_data_dir()
var mapsPath = userPath + "/SpinR/"
var button = load("res://Prefabs/MapButton.tscn")

func isSPRFile(file):
	if file.get_extension() == "spr":
		var instance = button.instantiate()
		instance.text = file
		$".".add_child(instance)

func _ready():
	var mapsList = DirAccess.get_files_at(mapsPath)
	var mapListArray = Array(mapsList)
	if mapListArray.filter(isSPRFile).size() != 0:
		mapListArray.filter(isSPRFile)
	else:
		$"../../NoMapsText".visible = true
	
