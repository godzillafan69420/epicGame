extends Area2D

class_name sideToSideEnemy

var dir
var speed
var Hitpoint: float = 50
@export var bread = preload("res://prefabs/extra_points.tscn")
@export var powerUps = preload("res://prefabs/power_up.tscn")
@export var Hp = preload("res://prefabs/hp.tscn")
@onready var thePlayer
@onready var bulletPrefab = preload("res://prefabs/bullet_to_player.tscn")

func _ready():
	thePlayer = get_parent().get_node("player")
	if dir == 1:
		speed = dir
	elif dir == 2:
		speed =-1
			
			
	$Timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed
	if Hitpoint < 0:
		GlobalVariables.score += 100
		var drops = randi_range(1,100)
		if drops == 1:
			var items = Hp.instantiate()
			items.position = position
			get_parent().add_child(items)
		elif drops < 60:
			var items = bread.instantiate()
			items.position = position
			get_parent().add_child(items)
		else:
			var items = powerUps.instantiate()
			items.position = position
			get_parent().add_child(items)
		queue_free()
	if position.x > 410 or position.x < -940:
		queue_free()
	if get_parent().gamePhase ==1:
		queue_free()
	



func _on_timer_timeout():
	if thePlayer != null:
		var bullets = bulletPrefab.instantiate()
		bullets.position = position
		bullets.theplayerDirtion = thePlayer.position-position
		get_parent().add_child(bullets)
		var bulletRight = bulletPrefab.instantiate()
		bulletRight.position = position
		bulletRight.theplayerDirtion = thePlayer.position + Vector2(100,0)-position
		get_parent().add_child(bulletRight)
		var bulletLeft = bulletPrefab.instantiate()
		bulletLeft.position = position
		bulletLeft.theplayerDirtion = thePlayer.position + Vector2(-100,0)-position
		get_parent().add_child(bulletLeft)


func _on_area_entered(area: Area2D) -> void:
	if area is bullet:
		Hitpoint -= 7.5
		area.queue_free()
	if area is bullet_shot2:
		Hitpoint -= 15
		area.queue_free()
	if area is superAttack:
		Hitpoint -= 100
		area.queue_free()
	if area is Rinbullet:
		Hitpoint -= 25
		area.queue_free()
	if area is Rinbulletno2:
		Hitpoint -= 7.5
		area.queue_free()
	if area is RinbulletNorm:
		Hitpoint -= 20
		area.queue_free()
	if area is deathZone:
		Hitpoint -= 10000
