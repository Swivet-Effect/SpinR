extends Marker2D

var in_area = false

func _physics_process(delta):
	var stickInput = Input.get_vector("ui_left","ui_right", "ui_up", "ui_down")
	look_at(stickInput)

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.queue_free()
