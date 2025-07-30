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
