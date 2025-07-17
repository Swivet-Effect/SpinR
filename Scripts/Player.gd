extends Marker2D

var in_area = false

func _physics_process(delta):
	
# Controller Input
	#var stickInput = Input.get_vector("ui_left","ui_right", "ui_up", "ui_down")
	#look_at(stickInput)
	
# Mouse Input
	look_at(get_global_mouse_position())
