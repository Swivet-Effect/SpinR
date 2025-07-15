extends MeshInstance2D

func _on_missed_area_body_entered(body: Node2D) -> void:
	queue_free()
