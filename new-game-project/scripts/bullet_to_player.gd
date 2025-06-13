extends Area2D

class_name bulletToPlayer
const bulletSpeed = 5
var theplayerDirtion 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += theplayerDirtion.normalized() * bulletSpeed
	if position.y > 295 and position.y < -295:
		queue_free()
