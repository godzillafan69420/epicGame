extends Area2D

class_name boss


var Hitpoint: float = 60000
var count: int = 0
var bossPhase: int = 0
@onready var thePlayer
@onready var bulletPrefab = preload("res://prefabs/bullet_to_player.tscn")
@onready var bossSuperBulletPre = preload("res://prefabs/boss_super_bullet.tscn")
const Bullet_scene = preload("res://prefabs/boss_bullet.tscn")
@onready var shoot_timer = $BulletIntervalForRotator
@onready var rotator = $Rotator

const rotate_speed: float = 100
const shooter_timer_wait_timer:float = 0.2
const spawn_point_count: int = 4
const radius: float = 100

func _ready() -> void:
	thePlayer = get_parent().get_node("player")
	var step = 2 * PI  / spawn_point_count
		
	for i in range(spawn_point_count):
		var spawn_point =  Node2D.new()
		var pos = Vector2(radius, 0).rotated(step*i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotator.add_child(spawn_point)
	shoot_timer.wait_time = shooter_timer_wait_timer
	$BulletIntervalForRotator.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Hitpoint < 0:
		queue_free()
	
	if bossPhase == 1 and count != 1:
		$BossShotgunInterval.start()
		count = 1
	if bossPhase == 2 and count != 1:
		$bulletShootinEverywhere.start()
		count = 1
	if bossPhase == 3:
		var new_rotation = rotator.rotation_degrees + rotate_speed * delta
		rotator.rotation_degrees = fmod(new_rotation,360)
	if bossPhase == 3 and count !=1:
		$shootTowardsThePlayer.start() 
		count = 1
	if Hitpoint < 40000 and Hitpoint > 20000:
		bossPhase = 2
	elif Hitpoint < 20000:
		bossPhase = 3
	
	



		


func _on_area_entered(area: Area2D) -> void:
	if area is bullet:
		Hitpoint -= 5
		
		area.queue_free()
	if area is bullet_shot2:
		Hitpoint -= 15
		area.queue_free()
	if area is superAttack:
		Hitpoint -= 22.5
		area.queue_free()
	if area is Rinbullet:
		Hitpoint -= 150
		area.queue_free()
	if area is Rinbulletno2:
		Hitpoint -= 7.5
		area.queue_free()
	if area is RinbulletNorm:
		Hitpoint -= 20
		area.queue_free()
	if area is deathZone:
		Hitpoint -= 10000
	if area is hollowPurple:
		Hitpoint -= 10000






func _on_boss_shotgun_interval_timeout() -> void:
	for i in range(-10,10):
		if thePlayer != null:
			var bullets = bulletPrefab.instantiate()
			bullets.position = position
			bullets.theplayerDirtion = thePlayer.position+Vector2(50*i,0)-position
			get_parent().add_child(bullets)
	count =0
	
	
	
	




func _on_shoot_towards_the_player_timeout() -> void:
	var bullets = bossSuperBulletPre.instantiate()
	bullets.position = position
	bullets.theplayerDirtion = thePlayer.position-position
	get_parent().add_child(bullets)
	count = 0


func _on_slower_shotgun_timeout() -> void:
	for i in range(75):
		if thePlayer != null and bossPhase == 2:
			var bullets = bulletPrefab.instantiate()
			bullets.position = position
			bullets.theplayerDirtion = Vector2(randf_range(-100,100),randf_range(-100,100))
			get_parent().add_child(bullets)
	count =0


func _on_bullet_interval_for_rotator_timeout() -> void:
	if  bossPhase == 3:
		if thePlayer != null:
			for s in rotator.get_children():
				var bullets = Bullet_scene.instantiate()
				get_parent().add_child(bullets)
				bullets.position = s.global_position
				bullets.rotation = s.global_rotation
