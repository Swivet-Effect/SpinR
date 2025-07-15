extends Marker2D

@onready var firer = $Firer
var map = {}
var map_file_path = "res://Map.json"
var beat = 0

func move():
	if beat < map.size():
		rotation_degrees = map[beat]
		firer.fire()
		print(map[beat])
		beat += 1
	
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
	
	move()
