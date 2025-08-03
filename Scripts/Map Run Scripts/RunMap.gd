extends Marker2D

@onready var audioPlayer = $"Music Player"
@onready var firer = $Firer

var mapNoNulls
var map = {}
var userPath = OS.get_data_dir()
var map_file_path = userPath + "/SpinR/" + Global.mapTitle + ".spr"

var countdown

func move():
	if Global.beat < map.size():
		if map[Global.beat] != null:
			rotation_degrees = map[Global.beat]
		firer.fire()
		if Global.playing == true:
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
	Global.beat = 1
	Global.reset = false
	Global.playing = true
	Global.totalOrbs = 0.0
	Global.hitOrbs = 0.0
	
	mapNoNulls = map.size() - map.count(null) - 1
	
	audioPlayer.stream = music
	
	$MusicDelay.start()
	
	move()
	
	countdown = 3
	$"../StartCountdown".text = str(countdown)
	$"../StartCountdown/CountdownTimer".start()

func _on_music_delay_timeout():
	audioPlayer.volume_linear = Global.volume / 100.0
	audioPlayer.play()

func _physics_process(_delta):
	if Global.totalOrbs == float(mapNoNulls):
		Global.destination = "Completion"
		get_tree().change_scene_to_file(Global.loadScreen)

func CountdownTimerOut():
	countdown -= 1
	if countdown != 0:
		$"../StartCountdown".text = str(countdown)
		$"../StartCountdown/CountdownTimer".start()
	else:
		$"../StartCountdown".visible = false
		$"../Accuracy".visible = true
