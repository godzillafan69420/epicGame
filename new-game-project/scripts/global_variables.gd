extends Node

var score = 0
var PlayerHP = 2
var playerBombs = 4
var playerPower = 10
var souls = 10

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("MainMenu"):
		get_tree().change_scene_to_file("res://ui/main_menu.tscn")
