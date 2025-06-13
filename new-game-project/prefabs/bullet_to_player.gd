extends Area2D

class_name bulletToPlayer
const bulletSpeed = 8
var theplayerDirtion 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += theplayerDirtion.normalized() * bulletSpeed
