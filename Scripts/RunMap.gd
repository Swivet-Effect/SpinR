extends Marker2D

@onready var audioPlayer = $AudioStreamPlayer
@onready var firer = $Firer
var map = {}
var mapMeta = {}
var map_audio_path = load("res://Maps/TestMap/testmusic.mp3")
var map_file_path = "res://Maps/TestMap/Map.json"
var map_meta_path = "res://Maps/TestMap/MapMeta.json"

func move():
	if Speedcontrol.beat < map.size():
		rotation_degrees = map[Speedcontrol.beat]
		firer.fire()
		Speedcontrol.beat += 1

func _ready():
	if FileAccess.file_exists(map_file_path):
		var dataFile = FileAccess.open(map_file_path, FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		if parsedResult is Array:
			map = parsedResult
		else:
			print("Error Reading Beat Map File")
	else:
		print("No Beat Map File Found")
		
	if FileAccess.file_exists(map_meta_path):
		var metaDataFile = FileAccess.open(map_meta_path, FileAccess.READ)
		var parsedResult = JSON.parse_string(metaDataFile.get_as_text())
		if parsedResult is Dictionary:
			mapMeta = parsedResult
		else:
			print("Error Reading Meta File")
	else:
		print("No Meta File Found")
	
	Speedcontrol.speed = mapMeta["speed"]
	Speedcontrol.reset = false
	
	audioPlayer.stream = map_audio_path
	audioPlayer.play()
	
	move()
