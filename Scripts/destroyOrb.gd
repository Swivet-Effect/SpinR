extends CharacterBody2D

var dir : float
var spawnPos : Vector2
var spawnRot : float

func _ready():
	global_position = spawnPos
	global_rotation = spawnRot

func _physics_process(_delta):
	if Speedcontrol.reset == true:
		queue_free()
	
	velocity = Vector2(Speedcontrol.speed, 0).rotated(dir)
	if Speedcontrol.failedCheck < 5:
		move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		Speedcontrol.failedCheck = 0
		Speedcontrol.totalOrbs += 1
		Speedcontrol.hitOrbs += 1
		$MeshInstance2D.visible = false
		$Area2D.set_deferred("monitoring", false)
		$GPUParticles2D.emitting = true

	if area.is_in_group("Missed"):
		Speedcontrol.failedCheck += 1
		Speedcontrol.totalOrbs += 1
		$MeshInstance2D.visible = false
		$Area2D.set_deferred("monitoring", false)
		$CanvasModulate.visible = true
		$CanvasModulate/Timer.start()

func _on_burst_finished():
	queue_free()

func _on_timer_timeout() -> void:
	queue_free()
