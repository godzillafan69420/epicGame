extends Area2D

class_name VmanElite
@onready var bulletsPre =preload("res://prefabs/smallLazers.tscn")
@onready var Bullet_scene = preload("res://prefabs/boss_bullet.tscn")
var Hitpoint: float = 100
@onready var shoot_timer =$Timer
@onready var rotator = $Rotator
@export var bread = preload("res://prefabs/extra_points.tscn")
@export var powerUps = preload("res://prefabs/power_up.tscn")
@export var Hp = preload("res://prefabs/hp.tscn")
@onready var thePlayer
const rotate_speed: float = 30
const shooter_timer_wait_timer: float = 1
const spawn_point_count: int = 3
const radius: float = 10
var inLazer: int = 0
func _ready() -> void:

	var step = 2 * PI  / spawn_point_count
		
	for i in range(spawn_point_count):
		var spawn_point =  Node2D.new()
		var pos = Vector2(radius, 0).rotated(step*i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotator.add_child(spawn_point)
	shoot_timer.wait_time = shooter_timer_wait_timer
	$Timer.start()
func _process(delta: float) -> void:
	var new_rotation = rotator.rotation_degrees + rotate_speed * delta
	rotator.rotation_degrees = fmod(new_rotation,360)
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
	Hitpoint -= 1.5*inLazer
	if get_parent().gamePhase ==1:
		queue_free()
func _on_timer_timeout() -> void:
	for s in rotator.get_children():
		var bullets = Bullet_scene.instantiate()
		get_parent().add_child(bullets)
		bullets.position = s.global_position
		bullets.rotation = s.global_rotation


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
