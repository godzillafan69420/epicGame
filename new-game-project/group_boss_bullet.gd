extends Area2D
class_name specialBossBullet
func _ready() -> void:
	add_to_group("Bullets")
func _process(delta: float) -> void:
	if global_position.y > 550  or global_position.y < -550:
		queue_free()
	if global_position.x > 410 or global_position.x < -950:
		queue_free()
