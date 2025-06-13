extends Area2D

class_name powerUp

func _ready():
	position.y -= 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += 4
	if position.y > 295:
		queue_free()
	


func _on_area_entered(area):
	if area is collectionArea:
		get_parent().Score += 10
		queue_free()
