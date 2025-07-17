extends Label

var accuracy : float

func _physics_process(delta):
	if Speedcontrol.totalOrbs == 0:
		accuracy = 100
	else:
		accuracy = 100 * (Speedcontrol.hitOrbs / Speedcontrol.totalOrbs)
	$".".text = str("%0.0f" % accuracy,"%")
