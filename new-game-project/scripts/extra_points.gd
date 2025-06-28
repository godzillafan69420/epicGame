extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position.y -= 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += 4
	if position.y > 550:
		queue_free()
	
	


func _on_area_entered(area):
	if area is collectionArea:
		GlobalVariables.score += 1000
		GlobalVariables.souls += 1
		queue_free()
	
