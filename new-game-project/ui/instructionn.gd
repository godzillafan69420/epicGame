extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Bomb"):
		get_tree().change_scene_to_file("res://ui/main_menu.tscn")
