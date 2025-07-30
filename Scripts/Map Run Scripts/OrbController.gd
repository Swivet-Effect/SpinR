extends CharacterBody2D

# Variable declaration
var dir : float
var spawnPos : Vector2
var spawnRot : float

func _ready():
# When the orb is created, set its actual position and rotation to the variables
	global_position = spawnPos
	global_rotation = spawnRot

func _physics_process(_delta):
	if Global.reset == true:
		queue_free()
	
	velocity = Vector2(Global.speed, 0).rotated(dir)
# Only move orb if player hasn't failed
	if Global.playing == true:
		move_and_slide()

func _on_area_2d_area_entered(area: Area2D):	
	if area.is_in_group("player"):
		$"Collision Detection".set_deferred("monitoring", false)
		$Graphic.visible = false
		Global.totalOrbs += 1.0
		Global.failedCheck = 0
		Global.hitOrbs += 1.0
		$"Explosion Effect".emitting = true

	if area.is_in_group("Missed"):
		$"Collision Detection".set_deferred("monitoring", false)
		$Graphic.visible = false
		Global.totalOrbs += 1.0
		Global.failedCheck += 1
		$"Red Flash".visible = true
		$"Red Flash/Flash Timer".start()

func _on_burst_finished():
	queue_free()

func _on_timer_timeout() -> void:
	queue_free()
