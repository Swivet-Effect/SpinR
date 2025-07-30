extends Label

var accuracy : float

func _physics_process(_delta):
# Avoid 0 division error
	if Global.totalOrbs == 0:
		accuracy = 100
	else:
		accuracy = 100 * (Global.hitOrbs / Global.totalOrbs)
	Global.accuracy	 = str("%0.0f" % accuracy,"%")
	$".".text = Global.accuracy
