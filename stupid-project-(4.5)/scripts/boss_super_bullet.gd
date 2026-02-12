extends Area2D

class_name superBulletForBoss
const bulletSpeed: float = 5
var theplayerDirtion: Vector2
func _ready() -> void:
	add_to_group("Bullets")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position += theplayerDirtion.normalized() * bulletSpeed
	if position.y > 550  or position.y < -550:
		queue_free()
	if position.x > 410 or position.x < -950:
		queue_free()
	if get_parent().gamePhase == 4:
		queue_free()
