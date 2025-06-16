extends Area2D

class_name bulletToPlayer
const bulletSpeed = 3
var theplayerDirtion 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += theplayerDirtion.normalized() * bulletSpeed
	if position.y > 300 or position.y < -300:
		queue_free()
	if position.x > 255 or position.x < -586:
		queue_free()
