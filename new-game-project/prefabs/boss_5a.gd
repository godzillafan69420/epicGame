extends Area2D

class_name bossNo5


var Hitpoint: float = 55000
var count: int = 0
var count2: int = 0
var bossPhase: int = 0
var windUp: bool = false
@onready var thePlayer 
@onready var bulletPrefab = preload("res://prefabs/bullet_to_player.tscn")
@onready var bossSuperBulletPre = preload("res://prefabs/boss_super_bullet.tscn")
@onready var coolPattern = preload("res://prefabs/BossBall.tscn")
const Bullet_scene = preload("res://prefabs/boss_bullet.tscn")
const square_scene = preload("res://prefabs/square attack.tscn")
@onready var shoot_timer = $rotatorAttack
@onready var rotator = $rotator

var inLazer: int = 0
var rotate_speed: float = 30
const shooter_timer_wait_timer: float = 0.2
const spawn_point_count: int = 6
const radius: float = 10
var direction
var NextPhase = 2

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
	$rotatorAttack.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().gamePhase == 1:
		monitoring = false
	else:
		monitoring = true
	if Hitpoint < 0:
		if GlobalVariables.CameraShake:
			get_parent().get_node("Camera2D").trauma = 0.5
		if GlobalVariables.enemyParticles:
			$explode.emitting = true
		
			await get_tree().create_timer(0.2).timeout
		
		AudioManager.play("res://sfx/vmanDying.wav")
		queue_free()
	
	if bossPhase == 1:
		var new_rotation = rotator.rotation_degrees + rotate_speed * delta
		rotator.rotation_degrees = fmod(new_rotation,360)
	if bossPhase == 1 and count != 1:
		$bossPhase1ShootTowards.start()
		count = 1
	if bossPhase == 2 and count != 1:
		$bossPhase2AttackSide.start()
		count = 1
	if bossPhase == 2 and count2 != 1:
		$bossPhase2ShotGun.start()
		count2 = 1
	if bossPhase == 3:
		var new_rotation = rotator.rotation_degrees + rotate_speed * delta
		rotator.rotation_degrees = fmod(new_rotation,360)
	if bossPhase == 3 and count != 1:
		$FunBullet.start()
		count = 1
	if bossPhase == 4 and count != 1:
		
	if Hitpoint < 44000 and Hitpoint > 34000:
		bossPhase = 2
	if (Hitpoint < 34000 and Hitpoint > 33000)or (Hitpoint < 45000 and Hitpoint > 44000) or (Hitpoint < 22000 and Hitpoint > 21000):
		bossPhase = 10
	if Hitpoint < 33000 and Hitpoint > 22000:
		rotate_speed = 60
		bossPhase = 3
	if Hitpoint < 21000 and Hitpoint > 11000:
		bossPhase =4
		position.x += direction * 10
		if position.x > 240:
			direction = -1
		if position.x < -710:
			direction = 1
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
		if area is fireBallOfDoom:
			Hitpoint -= 2500
		if area is Lazer:
			inLazer +=1


func _on_rotator_attack_timeout() -> void:
	if bossPhase == 1:
		for s in rotator.get_children():
			var bullets = coolPattern.instantiate()
			get_parent().add_child(bullets)
			bullets.position = s.global_position
			bullets.rotation = s.global_rotation
		
	
	if bossPhase == 3:
		
		for s in rotator.get_children():
			var bullets = square_scene.instantiate()
			get_parent().add_child(bullets)
			bullets.position = s.global_position
			bullets.rotation = s.global_rotation


func _on_boss_phase_1_shoot_towards_timeout() -> void:
	var bullets = bossSuperBulletPre.instantiate()
	bullets.position = position
	bullets.theplayerDirtion = thePlayer.position-position
	get_parent().add_child(bullets)
	count = 0
	




func _on_boss_phase_2_attack_side_timeout() -> void:
	for i in range(10):
		var bullets = bulletPrefab.instantiate()
		bullets.position = Vector2(-930, -490 + i * 150)
		bullets.theplayerDirtion = Vector2(1,0)
		get_parent().add_child(bullets)
	for i in range(10):
		var bullets = bulletPrefab.instantiate()
		bullets.position = Vector2(400, -415 + i * 150)
		bullets.theplayerDirtion = Vector2(-1,0)
		get_parent().add_child(bullets)
	count = 0
	
		


func _on_boss_phase_2_shot_gun_timeout() -> void:
	for i in range(-10,10):
		if windUp != true:
			var bullets = bulletPrefab.instantiate()
			bullets.position = position
			bullets.theplayerDirtion = thePlayer.position+Vector2(75*i,0)-position
			get_parent().add_child(bullets)
	
	count2 = 0

		
	


func _on_fun_bullet_timeout() -> void:
	var bullets = bulletPrefab.instantiate()
	bullets.position = position
	bullets.theplayerDirtion = thePlayer.position-position
	get_parent().add_child(bullets)
	count = 0
