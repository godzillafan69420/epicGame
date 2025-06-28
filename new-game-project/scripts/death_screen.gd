extends Control


func _on_button_button_down() -> void:
	GlobalVariables.PlayerHP = 2
	GlobalVariables.playerBombs = 4
	GlobalVariables.playerPower = 10
	GlobalVariables.souls = 0
	get_tree().change_scene_to_file("res://stages/firstStage.tscn")
	
