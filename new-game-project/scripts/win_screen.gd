extends Control

func _ready() -> void:
	$sceneTransition.get_node("ColorRect").color.a = 255
	$sceneTransition/AnimationPlayer.play("fade - in")
func _process(_delta: float) -> void:
	$Node2D/score.text = "Your Score: " + str(GlobalVariables.score)
	if $Node2D.position.y > -1800:
		$Node2D.position.y -= 1
	if Input.is_action_just_pressed("shoot"):
		GlobalVariables.PlayerHP = 2
		GlobalVariables.playerBombs = 4
		GlobalVariables.playerPower = 10
		GlobalVariables.souls = 0
		GlobalVariables.stage = 1
		get_tree().change_scene_to_file("res://ui/main_menu.tscn")
