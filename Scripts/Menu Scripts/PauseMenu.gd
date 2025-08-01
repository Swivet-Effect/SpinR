extends Control

@onready var music_node = get_node_or_null("../Screen Center/Music Player")

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			$CanvasLayer.visible = !$CanvasLayer.visible
			Global.playing = !Global.playing
			if music_node != null:
				music_node.stream_paused = !music_node.stream_paused

func RestartButton() -> void:
	Global.failedCheck = 0
	Global.hitOrbs = 0.0
	Global.totalOrbs = 0.0
	Global.beat = 1
	Global.reset = true
	Global.playing = true
	Global.pausable = true
	get_tree().change_scene_to_file(Global.loadScreen)

func OptionsButton() -> void:
	pass

func ToMenuButton() -> void:
	Global.reset = true
	if Global.isPractice == true:
		Global.destination = "Menu"
		get_tree().change_scene_to_file(Global.loadScreen)
	else:
		Global.destination = "Selection"
		get_tree().change_scene_to_file(Global.loadScreen)

func QuitButton() -> void:
	get_tree().quit()

func _ready():
	if Global.isPractice == false:
		$CanvasLayer/PauseBox/StraightenMenu/Restart.visible = true
	else:
		$CanvasLayer/PauseBox/StraightenMenu/Restart.visible = false
