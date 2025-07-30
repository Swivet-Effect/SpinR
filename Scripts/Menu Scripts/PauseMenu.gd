extends Control

@onready var music_node = get_node_or_null("../Screen Center/Music Player")

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			if $CanvasLayer.visible == false:
				$CanvasLayer.visible = true
				Global.playing = false
				if music_node != null:
					music_node.stream_paused = true
			elif $CanvasLayer.visible == true:
				$CanvasLayer.visible = false
				Global.playing = true
				if music_node != null:
					music_node.stream_paused = false

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
	get_tree().change_scene_to_file(Global.mapSelection)

func QuitButton() -> void:
	get_tree().quit()
