extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		GlobalVariables.PlayerHP = 2
		GlobalVariables.playerBombs = 4
		GlobalVariables.playerPower = 70
		GlobalVariables.souls = 0
		if GlobalVariables.stage == 1:
			get_tree().change_scene_to_file("res://stages/firstStage.tscn")
		if GlobalVariables.stage == 2:
			get_tree().change_scene_to_file("res://stages/stage_2.tscn")
		if GlobalVariables.stage == 3:
			get_tree().change_scene_to_file("res://stages/stage_3.tscn")
	if Input.is_action_just_pressed("Bomb"):
		GlobalVariables.PlayerHP = 2
		GlobalVariables.playerBombs = 4
		GlobalVariables.playerPower = 10
		GlobalVariables.souls = 0
		GlobalVariables.stage = 1
		get_tree().change_scene_to_file("res://ui/main_menu.tscn")
	
func _on_button_button_down() -> void:
	GlobalVariables.PlayerHP = 2
	GlobalVariables.playerBombs = 4
	GlobalVariables.playerPower = 70
	GlobalVariables.souls = 0
	if GlobalVariables.stage == 1:
		get_tree().change_scene_to_file("res://stages/firstStage.tscn")
	if GlobalVariables.stage == 2:
		get_tree().change_scene_to_file("res://stages/stage_2.tscn")
	if GlobalVariables.stage == 3:
		get_tree().change_scene_to_file("res://stages/stage_3.tscn")
	
	


func _on_quit_button_down() -> void:
	GlobalVariables.PlayerHP = 2
	GlobalVariables.playerBombs = 4
	GlobalVariables.playerPower = 10
	GlobalVariables.souls = 0
	GlobalVariables.stage = 1
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
