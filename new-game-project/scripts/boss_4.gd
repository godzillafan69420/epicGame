extends Area2D

class_name bossNo4


var Hitpoint: float = 50000
var count: int = 0
var count2: int = 0
var bossPhase: int = 0
@onready var thePlayer 
@onready var bulletPrefab = preload("res://prefabs/bullet_to_player.tscn")
@onready var bossSuperBulletPre = preload("res://prefabs/boss_super_bullet.tscn")
const Bullet_scene = preload("res://prefabs/boss_bullet.tscn")
@onready var shoot_timer = $BulletIntervalForRotator
@onready var rotator = $Rotator
@onready var rotator2 = $Rotator2
var inLazer: int = 0
const rotate_speed: float = 30
const shooter_timer_wait_timer: float = 0.3
const spawn_point_count: int = 3
const radius: float = 10


func _ready() -> void:
	var step = 2 * PI  / spawn_point_count
	thePlayer = get_parent().get_node("player")
	for i in range(spawn_point_count):
		var spawn_point =  Node2D.new()
		
		var pos = Vector2(radius, 0).rotated(step*i)
		spawn_point.visible = false
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()	
		rotator.add_child(spawn_point)
		
	var otherStep = (2 * PI  / spawn_point_count)
		
	for i in range(spawn_point_count):
		var spawn_point =  Node2D.new()
		var pos = Vector2(0, radius).rotated(otherStep*i)
		spawn_point.visible = false
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()	
		$Rotator2.add_child(spawn_point)
	for i in range(spawn_point_count):
		var spawn_point =  Node2D.new()
		var pos = Vector2(0, radius).rotated(otherStep*i)
		spawn_point.visible = false
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()	
		$Rotator3.add_child(spawn_point)
	for i in range(spawn_point_count):
		var spawn_point =  Node2D.new()
		var pos = Vector2(0, radius).rotated(otherStep*i)
		spawn_point.visible = false
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()	
		$Rotator4.add_child(spawn_point)
	shoot_timer.wait_time = shooter_timer_wait_timer
	$BulletIntervalForRotator.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().gamePhase == 1:
		monitoring = false
	else:
		monitoring = true
	if Hitpoint < 0:
		get_parent().get_node("Camera2D").trauma = 0.5
		AudioManager.play("res://sfx/boom.wav")
		queue_free()
	
	if bossPhase == 2:
		var new_rotation = rotator.rotation_degrees + rotate_speed * delta
		rotator.rotation_degrees = fmod(new_rotation,360)
		var new_rotation2 = $Rotator2.rotation_degrees -rotate_speed * delta
		$Rotator2.rotation_degrees = fmod(new_rotation2,360)
		$Rotator3.rotation_degrees = fmod(new_rotation,360)
		$Rotator4.rotation_degrees = fmod(new_rotation2,360)
	if (bossPhase == 1  or bossPhase == 3)and count != 1:
		$bulletShootinEverywhere.start()
		count = 1

	if bossPhase == 2 and count != 1:
		$shootTowardsThePlayer.start()
		count = 1
	if bossPhase == 1 and count2 != 1:
		$BossShotgunInterval.start()
		count2 = 1
	if bossPhase == 3 and count2 != 1:
		$phase3Attack.start()
		count2 = 1
	if bossPhase == 4:
		var new_rotation = rotator.rotation_degrees + rotate_speed * delta
		rotator.rotation_degrees = fmod(new_rotation,360)
		var new_rotation2 = $Rotator2.rotation_degrees -rotate_speed * delta
		$Rotator2.rotation_degrees = fmod(new_rotation2,360)
		$Rotator3.rotation_degrees = fmod(new_rotation,360)
		$Rotator4.rotation_degrees = fmod(new_rotation2,360)
	if bossPhase == 4 and count2 != 1:
		$phase3Attack.start()
		count2 = 1
	if Hitpoint < 37500 and Hitpoint > 25000:
		bossPhase = 2
	
	if Hitpoint < 25000 and Hitpoint > 12500:
		
		bossPhase = 3
	if Hitpoint < 12500:
	
		bossPhase = 4
	Hitpoint -= 2*inLazer



		


func _on_area_entered(area: Area2D) -> void:
	if get_parent().gamePhase != 1:
		if area is bullet:

			Hitpoint -= 5
			area.queue_free()
		elif area is bullet_shot2:

			Hitpoint -= 20
			area.queue_free()
		elif area is superAttack:

			Hitpoint -= 100
			area.queue_free()
		elif area is Bomb:

			Hitpoint -= 100
		elif area is Rinbullet:

			Hitpoint -= 150
			area.queue_free()
		elif area is Rinbulletno2:

			Hitpoint -= 7.5
			area.queue_free()
		
		elif area is RinbulletNorm:

			Hitpoint -= 20
			area.queue_free()
		elif area is deathZone:
			
			Hitpoint -= 10000
		elif area is hollowPurple:
			
			Hitpoint -= 10000
		elif area is LazerShot2:
			Hitpoint -= 15
		
			area.queue_free()
		elif area is smallLazers:

			Hitpoint -= 5
		if area is Lazer:
			inLazer +=1




func _on_boss_shotgun_interval_timeout() -> void:
	for i in range(-10,10):
		if thePlayer != null:
			var bullets = bulletPrefab.instantiate()
			bullets.position = position
			bullets.theplayerDirtion = thePlayer.position+Vector2(75*i,0)-position
			get_parent().add_child(bullets)
	count2 =0
	
	
	




func _on_shoot_towards_the_player_timeout() -> void:
	if bossPhase ==2:
		for i in range(25):
			var bullets = bulletPrefab.instantiate()
			bullets.position = Vector2(-50* i +randf_range(0,100), -540)
			bullets.theplayerDirtion = Vector2(0,0.1)
			get_parent().add_child(bullets)
		for i in range(25):
			var bullets = bulletPrefab.instantiate()
			bullets.position = Vector2(50* i + randf_range(0,100), -540)
			bullets.theplayerDirtion = Vector2(0,0.1)
			get_parent().add_child(bullets)
	count = 0


func _on_slower_shotgun_timeout() -> void:
	pass


func _on_bullet_interval_for_rotator_timeout() -> void:
	if  bossPhase == 2 or bossPhase == 4:
		if thePlayer != null:
			for s in rotator.get_children():
				var bullets = Bullet_scene.instantiate()
				get_parent().add_child(bullets)
				bullets.position = s.global_position
				bullets.rotation = s.global_rotation
			for j in $Rotator2.get_children():
				var bullets = Bullet_scene.instantiate()
				get_parent().add_child(bullets)
				bullets.position = j.global_position
				bullets.rotation = j.global_rotation
			for j in $Rotator3.get_children():
				var bullets = Bullet_scene.instantiate()
				get_parent().add_child(bullets)
				bullets.position = j.global_position
				bullets.rotation = j.global_rotation
			for j in $Rotator4.get_children():
				var bullets = Bullet_scene.instantiate()
				get_parent().add_child(bullets)
				bullets.position = j.global_position
				bullets.rotation = j.global_rotation


func _on_bullet_shootin_everywhere_timeout() -> void:
	
	var bullets = bossSuperBulletPre.instantiate()
	bullets.position = position
	bullets.theplayerDirtion = thePlayer.position - position
	get_parent().add_child(bullets)

	count = 0
	
	


func _on_phaseattack_timeout() -> void:
	if thePlayer != null and bossPhase == 2:
		
		for i in range(25):
			var bullets = bulletPrefab.instantiate()
			bullets.position = Vector2(randf_range(-920,400),randf_range(-550,-200))
			bullets.theplayerDirtion =thePlayer.position - position
			get_parent().add_child(bullets)
	count =0


func _on_phase_3_attack_timeout() -> void:
	for i in range(100):
		if thePlayer != null and (bossPhase == 3 or bossPhase == 4):
			var bullets = bulletPrefab.instantiate()
			bullets.position = position
			bullets.theplayerDirtion = Vector2(randf_range(-100,100),randf_range(-100,100))
			get_parent().add_child(bullets)
	count2 =0


func _on_area_exited(area: Area2D) -> void:
	if area is Lazer:
		inLazer -=1
