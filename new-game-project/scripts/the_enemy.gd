extends Area2D

class_name GuyShootTowardsYou

var Hitpoint: float = 50
@onready var bulletsPre =preload("res://prefabs/smallLazers.tscn")
@export var bread = preload("res://prefabs/extra_points.tscn")
@export var powerUps = preload("res://prefabs/power_up.tscn")
@export var Hp = preload("res://prefabs/hp.tscn")
@onready var thePlayer
@onready var bulletPrefab = preload("res://prefabs/bullet_to_player.tscn")
var inLazer: int = 0
func _ready():
	$Timer.start()
	thePlayer = get_parent().get_node("player")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.y += 1
	if Hitpoint < 0:
		$explode.emitting = true
		
		await get_tree().create_timer(0.2).timeout
		if GlobalVariables.character == 2 and GlobalVariables.shotType == 2:
			for i in range(8):
				var bullets = bulletsPre.instantiate()
				bullets.position = position
				bullets.rotation = deg_to_rad(-90+ 45*i)
				get_parent().add_child(bullets)
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
		AudioManager.play("res://sfx/ouchForEnemies.wav")
		queue_free()
	if position.y > 550:
		queue_free()
	if get_parent().gamePhase ==1:
		queue_free()
	
	Hitpoint -= 1.5*inLazer


func _on_timer_timeout():
	if thePlayer != null:
		var bullets = bulletPrefab.instantiate()
		bullets.position = position
		bullets.theplayerDirtion = thePlayer.position-position
		get_parent().add_child(bullets)
		


func _on_area_entered(area: Area2D) -> void:
	if area is bullet:
		Hitpoint -= 7.5
		area.queue_free()
	if area is bullet_shot2:
		Hitpoint -= 20
		area.queue_free()
	if area is superAttack:
		Hitpoint -= 100
		area.queue_free()
	if area is Bomb:
		Hitpoint -= 100
	if area is Rinbullet:
		Hitpoint -= 25
		area.queue_free()
	if area is Rinbulletno2:
		Hitpoint -= 7.5
		area.queue_free()
	if area is RinbulletNorm:
		Hitpoint -= 20
		area.queue_free()
	elif area is LazerShot2:
		Hitpoint -= 15
		
		area.queue_free()
	elif area is smallLazers:
		Hitpoint -= 5
		
		area.queue_free()
	if area is deathZone:
		Hitpoint -= 10000
	if area is hollowPurple:
		Hitpoint -= 10000
	if area is Lazer:
		inLazer +=1
	if area is fireBallOfDoom:
			Hitpoint -= 2500

func _on_area_exited(area: Area2D) -> void:
	if area is Lazer:
		inLazer -=1
