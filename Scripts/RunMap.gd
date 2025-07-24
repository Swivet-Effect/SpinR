extends Marker2D

@onready var audioPlayer = $"Music Player"
@onready var firer = $Firer

var map = {}
var map_file_path = "C:/Users/dyfry/AppData/Roaming/SpinR/Test2.spr"

func move():
	if Global.beat < map.size():
		rotation_degrees = map[Global.beat]
		firer.fire()
		Global.beat += 1

func _ready():
	var reader = ZIPReader.new()
	reader.open(map_file_path)
	var mapRawData = reader.read_file("map.json")
	var mapString = mapRawData.get_string_from_utf8()
	var parseMapData = JSON.parse_string(mapString)
	map = parseMapData

	var musicfile = reader.read_file("music.mp3")
	var music = AudioStreamMP3.load_from_buffer(musicfile)
	
	reader.close()
	
	Global.speed = map[0]["speed"]
	Global.reset = false

	audioPlayer.stream = music
	audioPlayer.play()
	
	move()
