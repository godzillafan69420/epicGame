extends Node

var score: int = 0
var PlayerHP: int = 3
var playerBombs: int = 4
var playerPower: int = 20
var souls: int = 10
var shotType: int = 1
var character: int = 2
var enemies: Array = [enemy,
boss,
bossNo2,
bossNo3,
bossNo4,
sideToSideEnemy,
VmanElite,
GuyShootTowardsYou]
var muteMusic = false
var stage: int = 1

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("MainMenu"):
		get_tree().change_scene_to_file("res://ui/main_menu.tscn")
