extends Node

var score: int = 0
var PlayerHP: int = 10
var playerBombs: int = 10
var playerPower: int = 100
var souls: int = 10
var shotType: int = 2
var character: int = 3

var stage: int = 1

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("MainMenu"):
		get_tree().change_scene_to_file("res://ui/main_menu.tscn")
