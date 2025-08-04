extends Button

@export var index = 0

func WhenPressed():
	Global.previousBeat = Global.currentBeat
	Global.currentBeat = index
	Global.beatAngle = $".".text

func _physics_process(_delta):
	if index == Global.currentBeat:
		$".".text = str(Global.beatAngle)
