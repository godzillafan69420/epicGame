extends Area2D

class_name HpGiver

func _ready():
	position.y -= 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.y += 4
	if position.y > 550:
		queue_free()
	
