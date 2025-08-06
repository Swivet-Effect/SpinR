extends Button

var index

func WhenPressed():
	Global.previousBeat = Global.currentBeat
	Global.currentBeat = index
	Global.beatAngle = $".".text

func _physics_process(_delta):
	if index == Global.currentBeat:
		if Global.beatAngle != null:
			$".".text = str(Global.beatAngle)
		else:
			$".".text = "[ ]"
