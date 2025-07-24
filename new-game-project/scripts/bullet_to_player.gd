extends Area2D

class_name bulletToPlayer
const bulletSpeed: int = 4
var theplayerDirtion: Vector2
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += theplayerDirtion.normalized() * bulletSpeed
	if position.y > 550  or position.y < -550:
		queue_free()
	if position.x > 410 or position.x < -950:
		queue_free()
	if get_parent().gamePhase ==1:
		queue_free()
	if get_parent().gamePhase == 4:
		queue_free()
