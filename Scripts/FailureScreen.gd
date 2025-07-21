extends CanvasLayer

func _physics_process(_delta):
	if Speedcontrol.failedCheck < 5:
		$".".visible = false
	else:
		$".".visible = true

func _on_button_pressed():
	Speedcontrol.failedCheck = 0
	Speedcontrol.hitOrbs = 0.0
	Speedcontrol.totalOrbs = 0.0
	Speedcontrol.beat = 0
	Speedcontrol.reset = true
	get_tree().change_scene_to_file("res://Prefabs/LoadScreen.tscn")
