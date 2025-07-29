extends Control

func _ready():
	$"CanvasLayer/Accuracy Text/Accuracy".text = Global.accuracy

func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file(Global.mainMenu)
