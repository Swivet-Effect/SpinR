extends Node

var speed = 100

func _input(event):
	if event.is_action_pressed("w"):
		speed += 100
	if event.is_action_pressed("s"):
		if speed > 0:
			speed -= 100
