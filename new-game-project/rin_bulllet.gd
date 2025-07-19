extends Area2D

class_name  Rinbullet
var dir = 0

func _process(delta: float) -> void:
	position += transform.x * 1000 * delta
	if position.y > 550  or position.y < -550:
		queue_free()
	if position.x > 410 or position.x < -950:
		queue_free()
	if get_parent().gamePhase == 4:
		queue_free()
