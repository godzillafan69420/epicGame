extends Area2D
class_name player3
@onready var bombPrefab = preload("res://prefabs/bombDeleteArea.tscn")
@onready var bulletPre = preload("res://prefabs/rin_bulllet.tscn")
@onready var superPrefab = preload("res://prefabs/special_2.gd")
@onready var bullet2Pre = preload("res://prefabs/lazer_shot_type_2.tscn")
@onready var bullet3Pre = preload("res://prefabs/rinBulletno2again.tscn")
@onready var special = preload("res://prefabs/special_2.tscn")
@onready var deathZones = preload("res://prefabs/death_zone.tscn")
var usingSuper = false

var wentToShoot = false
# Called when the node enters the scene tree for the first time.
const  Speed: float = 12
const slowSpeed: float = 5
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
	$lazer.visible = false
	$lazer.monitorable = false
	$lazer2.visible = false
	$lazer2.monitorable = false
	$lazer3.visible = false
	$lazer3.monitorable = false
	$lazer4.visible = false
	$lazer4.monitorable = false
	$lazer5.visible = false
	$lazer5.monitorable = false
	$hitboxes.hide()
	add_to_group("player")
	justDieded = false
	if GlobalVariables.character == 2 and GlobalVariables.shotType == 2:
		$shootinterval.wait_time = 0.15
		
	if GlobalVariables.character == 2 and GlobalVariables.shotType == 1:
		$shootinterval.wait_time = 0.25
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

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
	if GlobalVariables.shotType == 1 and GlobalVariables.character == 2:
		if Input.is_action_pressed("shoot") and get_parent().gamePhase != 1:
			$lazer.position = Vector2(0,-125)
			$lazer5.position = Vector2(-117.5,-5)
			$lazer2.position = Vector2(45.0,-65)
			$lazer3.position = Vector2(-50,-65)
			$lazer4.position = Vector2(115.0,-5)
			if bulletLevel <= 35:
				$lazer.visible = true
				$lazer.monitorable = true
				$lazer2.visible = false
				$lazer2.monitorable = false
				$lazer3.visible = false
				$lazer3.monitorable = false
				$lazer4.visible = false
				$lazer4.monitorable = false
				$lazer5.visible = false
				$lazer5.monitorable = false
			elif bulletLevel <= 75:
				$lazer.visible = true
				$lazer.monitorable = true
				$lazer2.visible = true
				$lazer2.monitorable = true
				$lazer3.visible = true
				$lazer3.monitorable = true
				$lazer4.visible = false
				$lazer4.monitorable = false
				$lazer5.visible = false
				$lazer5.monitorable = false
			elif bulletLevel <= 101:
				$lazer.visible = true
				$lazer.monitorable = true
				$lazer2.visible = true
				$lazer2.monitorable = true
				$lazer3.visible = true
				$lazer3.monitorable = true
				$lazer4.visible = true
				$lazer4.monitorable = true
				$lazer5.visible = true
				$lazer5.monitorable = true
		
		else:
			$lazer.visible = false
			$lazer.monitorable = false
			$lazer2.visible = false
			$lazer2.monitorable = false
			$lazer3.visible = false
			$lazer3.monitorable = false
			$lazer4.visible = false
			$lazer4.monitorable = false
			$lazer5.visible = false
			$lazer5.monitorable = false
	if GlobalVariables.shotType == 2 and GlobalVariables.character == 2:
		
		if Input.is_action_pressed("shoot") and get_parent().gamePhase != 1 and wentToShoot:
			if bulletLevel <= 35:
				for i in range(2):
					var bullets = bullet2Pre.instantiate()

					bullets.position = position + Vector2(25*i -12.5,0)- Vector2(0,YOffset)
					get_parent().add_child(bullets)
			elif bulletLevel <= 75:
				for i in range(4):
					var bullets = bullet2Pre.instantiate()

					bullets.position = position + Vector2(25*i -12.5-25,0)- Vector2(0,YOffset)
					get_parent().add_child(bullets)
			elif bulletLevel <= 101:
				
				for i in range(6):
					var bullets = bullet2Pre.instantiate()

					bullets.position = position + Vector2(25*i -50-12.5,0)- Vector2(0,YOffset)
					get_parent().add_child(bullets)
			wentToShoot = false
	if bulletLevel > 25 and Input.is_action_just_pressed("fireSpecial"):
		var fireBall = special.instantiate()
		fireBall.position = position
		get_parent().add_child(fireBall)
		bulletLevel -=25
	if bulletLevel > 100:
			bulletLevel = 100
	if Input.is_action_just_pressed("Bomb") and invincibility == false and amountOfBombs > 0:
		AudioManager.play("res://sfx/bomb.wav")
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
	
		
func uRdied():
	if GlobalVariables.enemyParticles:
		$explode.emitting = true
	if GlobalVariables.CameraShake:
		get_parent().get_node("Camera2D").trauma = 0.5
	$SePldead00.play()
	invincibility = true
	justDieded = true
	





func _on_area_entered(area):
	if (area is dangerousBalls or area is  bulletToPlayer or area is  superBulletForBoss or area is  coolPatternBullet or area is boss or area is bossNo2 or area is bossNo3 or area is bossNo4) and not invincibility:
		uRdied()
		$invincibility.start()


func _on_collect_bread_area_entered(area):
	
	if area is powerUp:
		$SeItem00.play()
		GlobalVariables.score += 100
		bulletLevel += 1
		area.queue_free()
	if area is extrapoint:
		$SeItem00.play()
		GlobalVariables.score += 1000
		GlobalVariables.souls += 1
		area.queue_free()
	if area is HpGiver:
		$SeExtend.play()
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


func _on_power_up_timeout() -> void:
	if bulletLevel < 100 and get_parent().gamePhase != 1:
		bulletLevel += 7
