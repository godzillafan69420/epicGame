extends Control

func _ready() -> void:
	$score.text = "Score "  + str(GlobalVariables.score)


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://prefabs/firstStage.tscn")
