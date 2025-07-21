extends Marker2D

@onready var firer = $Firer
var map = {}
var map_file_path = "res://Maps/Map.json"

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
			print("Error Reading File")
	else:
		print("No File Found")
	
	Speedcontrol.reset = false
	
	move()
