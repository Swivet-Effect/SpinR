extends Marker2D

var in_area = false

func _physics_process(_delta):
# Only move if the player hasn't failed
	if Global.failedCheck < 5:
		match Global.inputType:
			"mouse":
				look_at(get_global_mouse_position())
			"controller":
				var stickInput = Input.get_vector("ui_left","ui_right", "ui_up", "ui_down")
				look_at(stickInput)
			_ :
				print("Unkown Input Type")
