extends Node2D

@onready var enemyPre = preload("res://prefabs/elmo.tscn")
@onready var guyTowards = preload("res://prefabs/theEnemy.tscn")
@onready var shotGun = preload("res://prefabs/side_to_side_enemy.tscn")
var Score = 0
@onready var thePlayer = find_child("player")
var isPlayerAlive = true
var glaze = 0
var power = 0

func _on_elmo_spawn_rate_timeout():
	var elmo = enemyPre.instantiate()
	elmo.position = Vector2(randf_range(-530,200),-365)
	add_child(elmo)
	
func _process(delta):
	if thePlayer != null:
		$UI/score.text = "SCORE: " + str(Score)
		$UI/HP.text = "HP: " + str(thePlayer.HP)
		$UI/power.text = "power: " + str(power)
		$UI/bomb.text = "Bomb: " + str(thePlayer.amountOfBombs)
	if isPlayerAlive:
		power = thePlayer.bulletLevel
		glaze = thePlayer.glaze
		if thePlayer.HP == -1:
			isPlayerAlive = false
		if thePlayer.HP > -1 and thePlayer.justDieded and isPlayerAlive:
			thePlayer.position = Vector2(-160, 285)
			thePlayer.HP -= 1
			thePlayer.bulletLevel -= 20
			thePlayer.justDieded = false
		elif !isPlayerAlive:
			thePlayer.queue_free()
		
	
		
	


func _on_giga_spawn_rate_timeout():
	var strongGuy = guyTowards.instantiate()
	strongGuy.position = Vector2(randf_range(-530,200),-365)
	add_child(strongGuy)


func _on_side_to_side_timeout() -> void:
	var badGuy = shotGun.instantiate()
	var spwanPoint = randi_range(1,2)
	var xPoint
	if spwanPoint == 1:
		badGuy.dir = spwanPoint
		xPoint = -600
	else:
		badGuy.dir = spwanPoint
		xPoint = 250
	badGuy.position = Vector2(xPoint,-200)
	add_child(badGuy)
	
