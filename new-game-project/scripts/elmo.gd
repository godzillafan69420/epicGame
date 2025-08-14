extends Area2D

class_name enemy
@export var Hitpoint: float = 50
@export var balls = preload("res://prefabs/balls.tscn")
@export var bread = preload("res://prefabs/extra_points.tscn")
@export var powerUps = preload("res://prefabs/power_up.tscn")
@export var Hp = preload("res://prefabs/hp.tscn")
var inLazer: int = 0
var readytoShoot: bool = true
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
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
	position.y += 1
	if !readytoShoot:
		$Timer.start()
	if position.y > 550:
		queue_free()
	if get_parent().gamePhase ==1:
		queue_free()
	
	Hitpoint -= 1.5*inLazer
	
		


func _on_area_entered(area):
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
		Hitpoint -= 25
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
	if area is Lazer:
		inLazer += 1
	
	
func _on_timer_timeout():
	var ball = balls.instantiate()
	ball.position = position
	readytoShoot = false
	get_parent().add_child(ball)


func _on_area_exited(area: Area2D) -> void:
	if area is Lazer:
		inLazer -=1
