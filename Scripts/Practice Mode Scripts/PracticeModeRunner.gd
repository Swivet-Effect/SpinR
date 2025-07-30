extends Marker2D

@onready var firer = $"Practice Firer"
var rng = RandomNumberGenerator.new()

func move():
	rotation_degrees = rng.randf_range(0,360)
	firer.fire()

func _ready():
	Global.speed = 100
	Global.reset = false
	Global.playing = true
	move()
