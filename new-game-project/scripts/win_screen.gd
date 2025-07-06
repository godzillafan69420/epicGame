extends Control

func _ready() -> void:
	$score.text = "Score "  + str(GlobalVariables.score)


func _on_button_button_down() -> void:
	GlobalVariables.PlayerHP = 2
	GlobalVariables.playerBombs = 4
	GlobalVariables.playerPower = 10
	GlobalVariables.souls = 10

	get_tree().change_scene_to_file("res://stages/firstStage.tscn")
	
