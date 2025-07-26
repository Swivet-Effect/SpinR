extends Node2D

var map = []
var beat = -1

var map_file_path = "C:/Users/dyfry/AppData/Roaming/SpinR/" + Global.mapTitle + ".spr"

func _ready():
	var reader = ZIPReader.new()
	reader.open(map_file_path)
	var musicfile = reader.read_file("music.mp3")
	var music = AudioStreamMP3.load_from_buffer(musicfile)
	$MusicPlayer.stream = music
	$MusicPlayer.play()

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_select"):
		map[beat] = Global.playerRot

func _on_beat_timer_timeout():
	beat += 1
	map.append(0)
	$BeatTimer.start()

func _on_music_player_finished():
	var reader = ZIPReader.new()
	reader.open(map_file_path)
	var mapRawData = reader.read_file("map.json")
	var mapString = mapRawData.get_string_from_utf8()
	var parseMapData = JSON.parse_string(mapString)
	var mapOld = parseMapData
	map.insert(0, mapOld[0])
	for i in range(9):
		map.insert(1, 0)
	
	var musicfile = reader.read_file("music.mp3")
	
	reader.close()
	
	var writer = ZIPPacker.new()
	writer.open(map_file_path)
	writer.start_file("map.json")
	var mapJson = JSON.stringify(map)
	var mapConv = mapJson.to_utf8_buffer()
	writer.write_file(mapConv)
	writer.close_file()
	writer.start_file("music.mp3")
	writer.write_file(musicfile)
	writer.close()
	
