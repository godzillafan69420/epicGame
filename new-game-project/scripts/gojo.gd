extends Area2D
class_name player4
@onready var bombPrefab = preload("res://prefabs/bombDeleteArea.tscn")
@onready var bulletPre = preload("res://prefabs/hollow_purple.tscn")
@onready var superPrefab = preload("res://prefabs/super_attack.tscn")
@onready var bullet2Pre = preload("res://prefabs/shotgun_shoot_type_char_a.tscn")
@onready var gigaDamage = preload("res://prefabs/death_zone.tscn")
var usingSuper: bool = false

var wentToShoot: bool = false
# Called when the node enters the scene tree for the first time.
const  Speed: float = 10
const slowSpeed: float = 4
var moveX = 0
var moveY = 0
var justDieded: bool = false
const YOffset: float = 38
var bulletLevel = GlobalVariables.playerPower
var invincibility: bool = false
var currentSpeed = Speed
var HP = GlobalVariables.PlayerHP
var amountOfBombs = GlobalVariables.playerBombs
var bgChange = preload("res://images/infvoid.jpg")
@onready var bulletPrefab = bulletPre
func _ready():
	$hitboxes.hide()
	add_to_group("player")
	justDieded = false
	if GlobalVariables.character == 4 and GlobalVariables.shotType == 1:
		$shootinterval.wait_time = 1
	if GlobalVariables.character == 4 and GlobalVariables.shotType == 2:
		$shootinterval.wait_time = 1
	
	
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
	if GlobalVariables.shotType == 1 and GlobalVariables.character == 4:
		if Input.is_action_pressed("shoot") and get_parent().gamePhase != 1 and wentToShoot:
			var bullets = bulletPre.instantiate()
			
			bullets.position = position
			bullets.rotation = deg_to_rad(-90)
			get_parent().add_child(bullets)
		wentToShoot = false
	if GlobalVariables.shotType == 2 and GlobalVariables.character == 4:
		if Input.is_action_pressed("shoot") and get_parent().gamePhase != 1 and wentToShoot:
			var bullets = bulletPre.instantiate()
			
			bullets.position = position
			bullets.rotation = deg_to_rad(-90)
			get_parent().add_child(bullets)
		wentToShoot = false
	if Input.is_action_just_pressed("fireSpecial") and bulletLevel >= 90:
		bulletLevel -=90
		get_parent().get_node("Unnamed").texture = bgChange
		var deathZoneofDoom = gigaDamage.instantiate()
		deathZoneofDoom.position = Vector2(0,0)
		get_parent().add_child(deathZoneofDoom)
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
	if area is dangerousBalls or area is bulletToPlayer or area is superBulletForBoss or area is coolPatternBullet:
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
