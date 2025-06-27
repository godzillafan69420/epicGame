extends Node2D

@onready var BossFightTheme = preload("res://music/barryToes.mp3")
@onready var enemyPre = preload("res://prefabs/elmo.tscn")
@onready var guyTowards = preload("res://prefabs/theEnemy.tscn")
@onready var shotGun = preload("res://prefabs/side_to_side_enemy.tscn")
@onready var boss_1 = preload("res://prefabs/boss_1.tscn")
var Score = GlobalVariables.score
@onready var thePlayer = find_child("player")
@export var allowSideToSide= false
@export var normalEne = true
@export var shootTowards = false
var isPlayerAlive = true
var glaze = 0
var power = 0
var gamePhase = 0
signal spawnBoss

func _on_elmo_spawn_rate_timeout():
	if gamePhase == 0 and normalEne:
		var elmo = enemyPre.instantiate()
		elmo.position = Vector2(randf_range(-920,400),-550)
		add_child(elmo)

func _ready() -> void:
	$WhenBossSpawn.start()
func _process(delta):
	GlobalVariables.score = Score
	$"UI/WhenBoss spawn".text = "Boss in coming! " + str(int($WhenBossSpawn.time_left))
	if thePlayer != null:
		$UI/score.text = "SCORE: " + str(Score)
		$UI/HP.text = "HP: " + str(thePlayer.HP)
		$UI/power.text = "power: " + str(power)
		$UI/bomb.text = "Bomb: " + str(thePlayer.amountOfBombs)
		
		if gamePhase == 2:
			var theBoss = $boss
			if theBoss != null:
				$"UI/WhenBoss spawn".text = ""
				$UI/BossName.text = "BarryToes"

				$UI/BossHP.text = "Boss HP " + str(int(theBoss.Hitpoint))
			else:
				get_tree().change_scene_to_file("res://stages/stage_2.tscn")
			
	
		if isPlayerAlive:
			power = thePlayer.bulletLevel
			glaze = thePlayer.glaze
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
	else:
		get_tree().change_scene_to_file("res://ui/deathScreen.tscn")
		
	
		
	


func _on_giga_spawn_rate_timeout():
	if gamePhase == 0 and shootTowards:
		var strongGuy = guyTowards.instantiate()
		strongGuy.position = Vector2(randf_range(-530,200),-365)
		add_child(strongGuy)


func _on_side_to_side_timeout() -> void:
	if gamePhase == 0 and allowSideToSide:
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
	


func _on_when_boss_spawn_timeout() -> void:
	gamePhase = 1
	var b0ss = boss_1.instantiate()
	b0ss.position = Vector2(-160,-170)
	add_child(b0ss)
	
