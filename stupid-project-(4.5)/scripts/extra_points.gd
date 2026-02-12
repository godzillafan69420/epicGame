extends Area2D

class_name  extrapoint
# Called when the node enters the scene tree for the first time.
func _ready():
	position.y -= 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.y += 4
	if position.y > 550:
		queue_free()
	
	



	
