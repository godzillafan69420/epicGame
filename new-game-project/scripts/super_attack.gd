extends Area2D

class_name superAttack

func _process(_delta):
	position.y -= 30
	if position.y < -640:
		queue_free()


func _on_area_entered(area):
	if area is enemy or area is boss or area is sideToSideEnemy or area is GuyShootTowardsYou:
		queue_free()
