extends Area2D
class_name player2
@onready var bombPrefab = preload("res://prefabs/bombDeleteArea.tscn")
@onready var bulletPre = preload("res://prefabs/rin_bulllet.tscn")
@onready var superPrefab = preload("res://prefabs/super_attack.tscn")
@onready var bullet2Pre = preload("res://prefabs/rin_bullet_shot_2.tscn")
@onready var bullet3Pre = preload("res://prefabs/rinBulletno2again.tscn")
@onready var nuke = preload("res://prefabs/virus.tscn")
@onready var deathZones = preload("res://prefabs/death_zone.tscn")
var usingSuper = false

var wentToShoot = false
# Called when the node enters the scene tree for the first time.
const  Speed: float = 10
const slowSpeed: float = 3
var moveX = 0
var moveY = 0
var justDieded: bool = false
const YOffset: float = 38
var bulletLevel = GlobalVariables.playerPower
var invincibility: bool = false
var currentSpeed = Speed
var HP = GlobalVariables.PlayerHP
var amountOfBombs = GlobalVariables.playerBombs
@onready var bulletPrefab = bulletPre
func _ready():
	$hitboxes.hide()
	add_to_group("player")
	justDieded = false
	if GlobalVariables.character == 3 and GlobalVariables.shotType == 2:
		$shootinterval.wait_time = 0.1
		
	if GlobalVariables.character == 3 and GlobalVariables.shotType == 1:
		$shootinterval.wait_time = 0.25
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	GlobalVariables.playerBombs = amountOfBombs
	GlobalVariables.playerPower = bulletLevel
	GlobalVariables.PlayerHP = HP
	if bulletLevel < 0:
		bulletLevel = 1
	if HP > 10:
		HP = 10
	if position.y < 480 and Input.is_action_pressed("down"):
		moveY = currentSpeed
	elif position.y > -480 and Input.is_action_pressed("up"):
		moveY = -currentSpeed
	else:
		moveY = 0
	if Input.is_action_pressed("left") and position.x > -920:
		moveX = -currentSpeed
	elif Input.is_action_pressed("right") and position.x < 400:
		moveX = currentSpeed
	else:
		moveX =0
	position += Vector2(moveX,moveY)
	position.normalized()
	if Input.is_action_pressed("slowDown"):
		currentSpeed = slowSpeed
		$hitboxes.show()
	else:
		currentSpeed = Speed
		$hitboxes.hide()
	if GlobalVariables.shotType == 1 and GlobalVariables.character == 3:
		if Input.is_action_pressed("shoot") and get_parent().gamePhase != 1 and wentToShoot:
			if bulletLevel <= 25:
				for i in range(1):
					var bullets = bulletPre.instantiate()
					bullets.get_node("Sprite2D").modulate = Color8(randi_range(1,255),randi_range(1,255),randi_range(1,255),150)
					bullets.position = position
					bullets.rotation = deg_to_rad(-90)
					get_parent().add_child(bullets)
			elif bulletLevel <= 50:
				for i in range(2):
					
					var bullets = bulletPre.instantiate()
					bullets.get_node("Sprite2D").modulate = Color8(randi_range(1,255),randi_range(1,255),randi_range(1,255),150)
					bullets.position = position
					bullets.rotation = deg_to_rad(-90+ 180*i)
					get_parent().add_child(bullets)
			elif bulletLevel <= 75:
				for i in range(4):
					var bullets = bulletPre.instantiate()
					bullets.get_node("Sprite2D").modulate = Color8(randi_range(1,255),randi_range(1,255),randi_range(1,255),150)
					bullets.position = position
					bullets.rotation = deg_to_rad(-90 + 90*i)
					get_parent().add_child(bullets)
			elif bulletLevel <= 101:
				for i in range(8):
					var bullets = bulletPre.instantiate()
					bullets.get_node("Sprite2D").modulate = Color8(randi_range(1,255),randi_range(1,255),randi_range(1,255),150)
					bullets.position = position
					bullets.rotation = deg_to_rad(-90+ 45*i)
					get_parent().add_child(bullets)
			wentToShoot = false
		
	if GlobalVariables.shotType == 2 and GlobalVariables.character == 3:
		
		if Input.is_action_pressed("shoot") and get_parent().gamePhase != 1 and wentToShoot:
			for i in range(1):
					var bullets = bullet3Pre.instantiate()
					bullets.get_node("Sprite2D").modulate = Color8(randi_range(1,255),randi_range(1,255),randi_range(1,255),150)
					bullets.position = position- Vector2(0,YOffset)
					bullets.rotation = deg_to_rad(-90)
					get_parent().add_child(bullets)
			if bulletLevel <= 25:
				
				for i in range(1):
					var bullets = bullet2Pre.instantiate()
					bullets.position = position + Vector2(0,0)- Vector2(0,YOffset)
					bullets.rotation = deg_to_rad(-90)
					get_parent().add_child(bullets)
			elif bulletLevel <= 50:
				
				for i in range(2):
					var bullets = bullet2Pre.instantiate()
					bullets.position = position + Vector2(50*i - 25,0)- Vector2(0,YOffset)
					bullets.rotation = deg_to_rad(-90)
					get_parent().add_child(bullets)
			elif bulletLevel <= 75:
				
				for i in range(3):
					var bullets = bullet2Pre.instantiate()

					bullets.position = position + Vector2(50*i -50,0)- Vector2(0,YOffset)
					bullets.rotation = deg_to_rad(-90)
					get_parent().add_child(bullets)
			elif bulletLevel <= 101:
				
				for i in range(4):
					var bullets = bullet2Pre.instantiate()

					bullets.position = position + Vector2(50*i -75,0)- Vector2(0,YOffset)
					bullets.rotation = deg_to_rad(-90)
					get_parent().add_child(bullets)
			wentToShoot = false
	if bulletLevel > 100:
			bulletLevel = 100
	if Input.is_action_just_pressed("Bomb") and invincibility == false and amountOfBombs > 0:
		invincibility = true
		var bomb = bombPrefab.instantiate()
		bomb.position = position
		get_parent().add_child(bomb)
		$invincibility.start()
		amountOfBombs -= 1
	if invincibility:
		$drip.modulate = Color8(0,0,255,50)
	else:
		$drip.modulate = Color8(255,255,255,255)
	if Input.is_action_just_pressed("fireSpecial") and GlobalVariables.PlayerHP > 5 and GlobalVariables.playerPower > 50:
		get_parent().get_node("LoopingSong").stop()
		get_parent().get_node("BarryToes").stop()
		$"Emergency-alert-us-2".play()
		bulletLevel -= 50
		HP -= 5
		get_parent().get_node("sceneTransition").get_node("AnimationPlayer").play("flash")
		for i in range(10):
					var bullets = nuke.instantiate()
					
					bullets.position = Vector2(randf_range(0,1080),randf_range(0,1080))
					get_parent().add_child(bullets)
		var bullets = deathZones.instantiate()
		
		bullets.position = Vector2(0,0)
		get_parent().add_child(bullets)
		
func uRdied():
	invincibility = true
	justDieded = true
	





func _on_area_entered(area):
	if (area is dangerousBalls or area is  bulletToPlayer or area is  superBulletForBoss or area is  coolPatternBullet or area is boss) and not invincibility:
		uRdied()
		$invincibility.start()


func _on_collect_bread_area_entered(area):
	
	if area is powerUp:
		GlobalVariables.score += 100
		bulletLevel += 1
		area.queue_free()
	if area is extrapoint:
		GlobalVariables.score += 1000
		GlobalVariables.souls += 1
		area.queue_free()
	if area is HpGiver:
		GlobalVariables.score += 100
		HP += 1
		area.queue_free()
	
		


func _on_invincibility_timeout():
	invincibility = false


func _on_super_time_period_timeout() -> void:
	bulletLevel -= 10
	bulletPrefab = bulletPre
	usingSuper = false
	


func _on_shootinterval_timeout() -> void:
	wentToShoot = true
