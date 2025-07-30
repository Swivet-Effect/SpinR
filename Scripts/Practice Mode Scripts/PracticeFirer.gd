extends Node2D

@onready var pointer = $".."
@onready var reload_timer = $"Reload Timer"
@onready var main = get_tree().get_root()
@onready var projectile = load("res://Assets/Prefabs/Orb.tscn")
var doFire
var rng = RandomNumberGenerator.new()

func fire():
	look_at(pointer.global_position)
	if Global.playing:
		doFire = rng.randi_range(0,10)
	else:
		doFire = 1
		
	if doFire == 0:
		var instance = projectile.instantiate()
		instance.dir = global_rotation
		instance.spawnPos = global_position
		instance.spawnRot = rotation
		main.add_child.call_deferred(instance)

	reload_timer.start()

func _on_reload_timer_timeout():
	pointer.move()
