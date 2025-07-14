extends Node2D

var map = {}
var map_file_path = "res://Map.json"
var i = 0

var rng = RandomNumberGenerator.new()

@onready var reload_timer = $"ReloadTimer"
@onready var main = get_tree().get_root()
@onready var projectile = load("res://Orb.tscn")

func fire():
	if map[i] == 1:
		position = $"../Point 1".global_position
	elif map[i] == 2:
		position = $"../Point 2".global_position
	elif map[i] == 3:
		position = $"../Point 3".global_position
	elif map[i] == 4:
		position = $"../Point 4".global_position
	elif map[i] == 5:
		position = $"../Point 5".global_position
	elif map[i] == 6:
		position = $"../Point 6".global_position
	elif map[i] == 7:
		position = $"../Point 7".global_position
	elif map[i] == 8:
		position = $"../Point 8".global_position
	elif map[i] == 9:
		position = $"../Point 9".global_position
	elif map[i] == 10:
		position = $"../Point 10".global_position
	elif map[i] == 11:
		position = $"../Point 11".global_position
	elif map[i] == 12:
		position = $"../Point 12".global_position
	look_at($"../KillShot".global_position)
	
	i += 1
	
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.spawnRot = rotation
	main.add_child.call_deferred(instance)

	reload_timer.start()

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
	fire()

func _on_reload_timer_timeout() -> void:
	fire()
