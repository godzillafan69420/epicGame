extends Node2D

var speed = 100

func _process(delta: float) -> void:
	position += transform.x * 200 * delta
	$Node2D.rotate(deg_to_rad(45)* delta) 
	if position.y > 650  or position.y < -650:
		queue_free()
	if position.x > 510 or position.x < -1050:
		queue_free()
	if get_parent().gamePhase == 4:
		queue_free()
