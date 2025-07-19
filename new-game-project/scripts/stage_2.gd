extends Node2D

@onready var BossFightTheme = preload("res://music/barryToes.mp3")
@onready var enemyPre = preload("res://prefabs/elmo.tscn")
@onready var guyTowards = preload("res://prefabs/theEnemy.tscn")
@onready var shotGun = preload("res://prefabs/side_to_side_enemy.tscn")
@onready var boss_1 = preload("res://prefabs/Boss2.tscn")
var Score = GlobalVariables.score
@onready var thePlayerPre = preload("res://prefabs/player.tscn")
@onready var theRinPre = preload("res://prefabs/Rin.tscn")
var gameStarted = false
var thePlayer
@export var allowSideToSide= false
@export var normalEne = true
@export var shootTowards = true
var isPlayerAlive = true
var glaze = 0
var power = GlobalVariables.playerPower
var gamePhase = 0
signal spawnBoss

func _on_elmo_spawn_rate_timeout():
	if gamePhase == 0 and normalEne:
		var elmo = enemyPre.instantiate()
		elmo.position = Vector2(randf_range(-920,400),-550)
		add_child(elmo)

func _ready() -> void:
	if GlobalVariables.char == 1:
		thePlayer = thePlayerPre.instantiate()
		thePlayer.position = Vector2(-237,469)
		add_child(thePlayer)
	if GlobalVariables.char == 3:
		thePlayer = theRinPre.instantiate()
		thePlayer.position = Vector2(-237,469)
		add_child(thePlayer)
	$sceneTransition.get_node("ColorRect").color.a = 255
	$sceneTransition/AnimationPlayer.play("fade - in")
	$WhenBossSpawn.start()
	gameStarted = true
func _process(delta):
	$UI/score.text = "SCORE: " + str(GlobalVariables.score)

	$"UI/WhenBoss spawn".text = "Boss in coming! " + str(int($WhenBossSpawn.time_left))
	if thePlayer != null:
		$UI/score.text =  "Score: "+str(GlobalVariables.score)
		$UI/power.text = str(power)
		$UI/bomb.text = str(thePlayer.amountOfBombs)
		$UI/PlayerHealth.frame = thePlayer.HP - 1
		
		
		
		if gamePhase == 2:

			var theBoss = $ConeL

			if theBoss != null:
				$UI/healthBar.visible = true
				$UI/healthBar.max_value = 70000
				$UI/healthBar.value = theBoss.Hitpoint
				$"UI/WhenBoss spawn".text = ""
				$UI/BossName.text = "ConeL"


			else:
				$UI/UWon.visible = true
				gamePhase = 4
		if Input.is_action_just_pressed("shoot") and gamePhase == 4:
			GlobalVariables.stage = 3
			GlobalVariables.souls += 50
			GlobalVariables.score += 150000
			$sceneTransition/AnimationPlayer.play("fade-Out")
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_file("res://ui/store.tscn")
	
		if isPlayerAlive:
			power = thePlayer.bulletLevel
			glaze = thePlayer.glaze
			power = thePlayer.bulletLevel
			glaze = thePlayer.glaze
			if thePlayer.HP == 0:
				isPlayerAlive = false
			if thePlayer.HP > -1 and thePlayer.justDieded and isPlayerAlive:
				thePlayer.position = Vector2(-160, 285)
				thePlayer.HP -= 1
				thePlayer.bulletLevel -= 10
				thePlayer.justDieded = false
			elif !isPlayerAlive:
				thePlayer.queue_free()
				
				
	elif  gameStarted and thePlayer == null:
		get_tree().change_scene_to_file("res://ui/deathScreen.tscn")
		
	
		
	


func _on_giga_spawn_rate_timeout():
	if gamePhase == 0 and shootTowards:
		var strongGuy = guyTowards.instantiate()
		strongGuy.position = Vector2(randf_range(-920,400),-550)
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
	
	
	


func _on_ui_start_the_boss_music() -> void:
	$LoopingSong.stop()
	$BarryToes.play()
	$ConeL.bossPhase = 1
