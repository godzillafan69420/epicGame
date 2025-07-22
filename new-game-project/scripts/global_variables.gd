extends Node

var score = 0
var PlayerHP = 3
var playerBombs = 4
var playerPower = 100
var souls = 10
var shotType = 1
var char = 3

var stage = 1

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("MainMenu"):
		get_tree().change_scene_to_file("res://ui/main_menu.tscn")
