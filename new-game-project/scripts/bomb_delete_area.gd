extends Area2D

class_name Bomb

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= 2
	rotate(0.01)




func _on_timer_timeout():
	queue_free()


func _on_area_entered(area):
	if area is dangerousBalls or area is  bulletToPlayer or area is  superBulletForBoss or area is  coolPatternBullet:
		area.queue_free()
