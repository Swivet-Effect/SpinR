extends HBoxContainer

var button = load("res://Assets/Prefabs/NoBeat.tscn")

var userPath = OS.get_data_dir()
var filePath = userPath + "/SpinR/" + Global.mapTitle + ".spr"

var map = {}

var beats

func _ready():
	var reader = ZIPReader.new()
	reader.open(filePath)
	var mapRawData = reader.read_file("map.json")
	var mapString = mapRawData.get_string_from_utf8()
	var parseMapData = JSON.parse_string(mapString)
	map = parseMapData
	
	reader.close()
	
	beats = map.size() - 1
	
	for i in range(beats):
		var instance = button.instantiate()
		instance.index = i
		if map[i+1] != null:
			instance.text = str(map[i+1])
		$".".add_child(instance)

func _physics_process(_delta):
	if Global.currentBeat != Global.previousBeat:
		$"../../Panel/Time".text = str(Global.currentBeat*0.1) + " s"
		Global.previousBeat = Global.currentBeat
	map[Global.currentBeat + 1] = Global.beatAngle

func SaveMap():
	var reader = ZIPReader.new()
	reader.open(filePath)
	
	var musicfile = reader.read_file("music.mp3")
	
	reader.close()
	
	var writer = ZIPPacker.new()
	
	writer.open(filePath)
	writer.start_file("map.json")
	var mapJson = JSON.stringify(map)
	var mapConv = mapJson.to_utf8_buffer()
	writer.write_file(mapConv)
	writer.close_file()
	writer.start_file("music.mp3")
	writer.write_file(musicfile)
	writer.close()
	get_tree().change_scene_to_file(Global.mainMenu)

func ClearButtonPressed():
	Global.beatAngle = null

func ExitButtonPressed() -> void:
	Global.destination = "Menu"
	get_tree().change_scene_to_file(Global.loadScreen)
