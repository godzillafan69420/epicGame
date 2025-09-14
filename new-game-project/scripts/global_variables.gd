extends Node

var score: int = 0
var PlayerHP: int = 10
var playerBombs: int = 4
var playerPower: int = 200
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
var communism = false
var CameraShake = true
var enemyParticles = true
func _process(_delta: float) -> void:
	if communism:
		if get_tree().current_scene == null:
			return
		if get_tree().current_scene.get_node_or_null("sceneTransition") == null:
			return
		
		if(Input.is_action_just_pressed("Bomb") or Input.is_action_just_pressed("shoot") or Input.is_action_just_pressed("fireSpecial") or Input.is_action_just_pressed("slowDown")):
			AudioManager.play("res://sfx/communism.wav")
		get_tree().current_scene.get_node("sceneTransition").get_node("Sprite2D").visible = true
	else:
		if get_tree().current_scene == null:
			return
		if get_tree().current_scene.get_node_or_null("sceneTransition") == null:
			return
		
		
		get_tree().current_scene.get_node("sceneTransition").get_node("Sprite2D").visible = false
	
