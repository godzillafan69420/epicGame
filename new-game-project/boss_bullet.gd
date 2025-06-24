extends Area2D

class_name coolPatternBullet
func _process(delta: float) -> void:
	position += transform.x * 150 * delta
	if position.y > 300 or position.y < -300:
		queue_free()
	if position.x > 255 or position.x < -586:
		queue_free()
