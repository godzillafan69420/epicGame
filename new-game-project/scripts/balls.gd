extends Area2D


class_name dangerousBalls





var speed = 10




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += 5
	if position.y > 400:
		queue_free()
