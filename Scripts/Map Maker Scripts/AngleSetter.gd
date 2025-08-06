extends Marker2D

var hovering = false

func _physics_process(_delta):
	if Global.beatAngle != null:
		$".".global_rotation_degrees = float(Global.beatAngle)
	
	if hovering and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		look_at(get_global_mouse_position())
		Global.beatAngle = $".".global_rotation_degrees

func MouseOver():
	hovering = true

func MouseAway():
	hovering = false
