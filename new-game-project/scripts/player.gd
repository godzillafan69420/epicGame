extends Area2D
class_name player
@onready var bombPrefab = preload("res://prefabs/bombDeleteArea.tscn")
@onready var bulletPre = preload("res://prefabs/bullet.tscn")
@onready var superPrefab = preload("res://prefabs/super_attack.tscn")
@onready var bullet2Pre = preload("res://prefabs/shotgun_shoot_type_char_a.tscn")
var usingSuper = false

var wentToShoot = false
# Called when the node enters the scene tree for the first time.
const  Speed = 8
const slowSpeed = 4
var moveX = 0
var moveY = 0
var justDieded = false
const YOffset = 38
var bulletLevel = GlobalVariables.playerPower
var invincibility = false
var glaze = 0
var currentSpeed = Speed
var HP = GlobalVariables.PlayerHP
var amountOfBombs = GlobalVariables.playerBombs
@onready var bulletPrefab = bulletPre
func _ready():
	$hitboxes.hide()
	add_to_group("player")
	justDieded = false
	if GlobalVariables.char == 1 and GlobalVariables.shotType == 1:
		$shootinterval.wait_time = 0.05
	if GlobalVariables.char == 1 and GlobalVariables.shotType == 2:
		$shootinterval.wait_time = 0.15
	
	
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
	if GlobalVariables.shotType == 1 and GlobalVariables.char == 1:
		if Input.is_action_pressed("shoot") and get_parent().gamePhase != 1 and wentToShoot:
		
			if bulletLevel < 10:
				var bullet = bulletPrefab.instantiate()
				bullet.position = position - Vector2(0,YOffset)
		
				get_parent().add_child(bullet)
			elif bulletLevel < 25:
				var bullet = bulletPrefab.instantiate()
				var secoundbullet = bulletPrefab.instantiate()
				bullet.position = position - Vector2(10,YOffset)
				secoundbullet.position = position + Vector2(10,-YOffset)
				get_parent().add_child(bullet)
				get_parent().add_child(secoundbullet)
			elif bulletLevel < 50:
				var bulletNO1 = bulletPrefab.instantiate()
				var bulletNO2 = bulletPrefab.instantiate()
				var bulletNO3 = bulletPrefab.instantiate()
				var bulletNO4  = bulletPrefab.instantiate()
				bulletNO1.position = position - Vector2(10,YOffset)
				bulletNO2.position = position + Vector2(10,-YOffset)
				bulletNO3.position = position - Vector2(20,YOffset)
				bulletNO4.position = position + Vector2(20,-YOffset)
				get_parent().add_child(bulletNO1)
				get_parent().add_child(bulletNO2)
				get_parent().add_child(bulletNO3)
				get_parent().add_child(bulletNO4)
			elif bulletLevel < 75 :
				var bulletNO1 = bulletPrefab.instantiate()
				var bulletNO2 = bulletPrefab.instantiate()
				var bulletNO3 = bulletPrefab.instantiate()
				var bulletNO4  = bulletPrefab.instantiate()
				var bulletNO5  = bulletPrefab.instantiate()
				bulletNO1.position = position - Vector2(10,YOffset)
				bulletNO2.position = position + Vector2(10,-YOffset)
				bulletNO3.position = position - Vector2(20,YOffset)
				bulletNO4.position = position + Vector2(20,-YOffset)
				bulletNO5.position = position - Vector2(0,YOffset)
				get_parent().add_child(bulletNO1)
				get_parent().add_child(bulletNO2)
				get_parent().add_child(bulletNO3)
				get_parent().add_child(bulletNO4)
				get_parent().add_child(bulletNO5)
			elif bulletLevel <= 100  :
				var bulletNO1 = bulletPrefab.instantiate()
				var bulletNO2 = bulletPrefab.instantiate()
				var bulletNO3 = bulletPrefab.instantiate()
				var bulletNO4  = bulletPrefab.instantiate()
				var bulletNO5  = bulletPrefab.instantiate()
				var bulletNO6  = bulletPrefab.instantiate()
				var bulletNO7  = bulletPrefab.instantiate()
				bulletNO1.position = position - Vector2(10,YOffset)
				bulletNO2.position = position + Vector2(10,-YOffset)
				bulletNO3.position = position - Vector2(20,YOffset)
				bulletNO4.position = position + Vector2(20,-YOffset)
				bulletNO5.position = position - Vector2(0,YOffset)
				bulletNO6.position = position + Vector2(30,-YOffset)
				bulletNO7.position = position - Vector2(30,YOffset)
				get_parent().add_child(bulletNO1)
				get_parent().add_child(bulletNO2)
				get_parent().add_child(bulletNO3)
				get_parent().add_child(bulletNO4)
				get_parent().add_child(bulletNO5)
				get_parent().add_child(bulletNO6)
				get_parent().add_child(bulletNO7)
			wentToShoot = false
		
	if GlobalVariables.shotType == 2 and GlobalVariables.char == 1:
		if Input.is_action_pressed("shoot") and get_parent().gamePhase != 1 and wentToShoot:
		
			if bulletLevel < 10:
				var bullet = bullet2Pre.instantiate()
				bullet.position = position
				bullet.rotation = deg_to_rad(-90)
				get_parent().add_child(bullet)
			elif bulletLevel < 25:
				for i in range(3):
					var bullet = bullet2Pre.instantiate()
					bullet.position = position
					bullet.rotation = deg_to_rad(15*i-105)
					get_parent().add_child(bullet)
			elif bulletLevel < 50:
				for i in range(4):
					var bullet = bullet2Pre.instantiate()
					bullet.position = position
					bullet.rotation = deg_to_rad(15*i-115)
					get_parent().add_child(bullet)
			elif bulletLevel < 75:
				for i in range(5):
					var bullet = bullet2Pre.instantiate()
					bullet.position = position
					bullet.rotation = deg_to_rad(15*i-120)
					get_parent().add_child(bullet)
			elif bulletLevel <= 100:
				for i in range(7):
					var bullet = bullet2Pre.instantiate()
					bullet.position = position
					bullet.rotation = deg_to_rad(10*i-120)
					get_parent().add_child(bullet)
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
	if Input.is_action_just_pressed("fireSpecial") and bulletLevel > 20 and !usingSuper and GlobalVariables.shotType == 1 and GlobalVariables.char == 1:
		$superTimePeriod.start()
		bulletPrefab = superPrefab
		usingSuper = true
	if Input.is_action_just_pressed("fireSpecial") and bulletLevel > 20 and !invincibility and GlobalVariables.shotType == 2 and GlobalVariables.char == 1:
		invincibility = true
		var bomb = bombPrefab.instantiate()
		bomb.position = position
		get_parent().add_child(bomb)
		$invincibility.start()
		bulletLevel -=30
func uRdied():
	invincibility = true
	justDieded = true
	





func _on_area_entered(area):
	if (area is dangerousBalls or area is  bulletToPlayer or area is  superBulletForBoss or area is  coolPatternBullet or area is boss) and not invincibility:
		uRdied()
		$invincibility.start()


func _on_collect_bread_area_entered(area):
	
	if area is powerUp:
		bulletLevel += 1
	if area is HpGiver:
		HP += 1
	
		


func _on_invincibility_timeout():
	invincibility = false


func _on_super_time_period_timeout() -> void:
	bulletLevel -= 10
	bulletPrefab = bulletPre
	usingSuper = false
	


func _on_shootinterval_timeout() -> void:
	wentToShoot = true
