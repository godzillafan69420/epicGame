extends Area2D
class_name  bullet


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.y -= 10
	if position.y < -540:
		queue_free()
	if get_parent().gamePhase ==1:
		queue_free()


func _on_area_entered(area):
	if area is enemy:
		queue_free()
