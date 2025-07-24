extends Area2D

class_name enemy
@export var Hitpoint: float = 50
@export var balls = preload("res://prefabs/balls.tscn")
@export var bread = preload("res://prefabs/extra_points.tscn")
@export var powerUp = preload("res://prefabs/power_up.tscn")
@export var Hp = preload("res://prefabs/hp.tscn")
var readytoShoot: bool = true
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
			var items = powerUp.instantiate()
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
	
		


func _on_area_entered(area):
	if area is bullet:
		Hitpoint -= 5
		area.queue_free()
	if area is bullet_shot2:
		Hitpoint -= 15
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
	if area is deathZone:
		Hitpoint -= 10000

func _on_timer_timeout():
	var ball = balls.instantiate()
	ball.position = position
	readytoShoot = false
	get_parent().add_child(ball)
