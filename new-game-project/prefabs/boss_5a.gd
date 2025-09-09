extends Area2D

class_name bossNo5


var Hitpoint: float = 55000
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

	thePlayer = get_parent().get_node("player")

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
	
	
	Hitpoint -= 2*inLazer
