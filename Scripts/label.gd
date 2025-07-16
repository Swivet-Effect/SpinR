extends Label

var accuracy : float

func _physics_process(delta):
	if Speedcontrol.totalOrbs == 0:
		accuracy = 1.00
	else:
		accuracy = Speedcontrol.hitOrbs / Speedcontrol.totalOrbs
	$".".text = str("%0.2f" % accuracy,"%")
