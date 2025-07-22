extends Marker2D

@onready var audioPlayer = $"Music Player"
@onready var firer = $Firer

var map = {}
var map_file_path = "res://Maps/TestMap/Map.json"

func move():
	if Global.beat < map.size():
		rotation_degrees = map[Global.beat]
		firer.fire()
		Global.beat += 1

func _ready():
	if FileAccess.file_exists(map_file_path):
		var dataFile = FileAccess.open(map_file_path, FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		map = parsedResult
	
	Global.speed = map[0]["speed"]
	Global.reset = false
	
	var map_audio_path = load(map[0]["audioPath"])
	audioPlayer.stream = map_audio_path
	audioPlayer.play()
	
	move()
