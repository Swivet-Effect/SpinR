extends CanvasLayer

func _physics_process(_delta):
	if Global.failedCheck < 5:
		$".".visible = false
	else:
		$".".visible = true
		$"../../Screen Center/Music Player".playing = false

func _on_button_pressed():
	Global.failedCheck = 0
	Global.hitOrbs = 0.0
	Global.totalOrbs = 0.0
	Global.beat = 1
	Global.reset = true
	get_tree().change_scene_to_file("res://Prefabs/LoadScreen.tscn")
