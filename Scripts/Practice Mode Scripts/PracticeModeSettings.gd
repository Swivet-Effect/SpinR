extends CanvasLayer

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			match event.keycode:
				KEY_X:
					$".".visible = !$".".visible
				KEY_W:
					Global.speed += 50
				KEY_S:
					if Global.speed > 50:
						Global.speed -= 50
					else:
						Global.speed = 50
				KEY_Q:
					if Global.fireRate > 0:
						Global.fireRate -= 1
					else:
						Global.fireRate = 0
				KEY_A:
					Global.fireRate += 1
				KEY_Z:
					pass
				_:
					pass

func _ready():
	Global.speed = 100
	Global.fireRate = 10
