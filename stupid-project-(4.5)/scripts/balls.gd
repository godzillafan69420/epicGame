extends Area2D


class_name dangerousBalls





var speed: float = 5
func _ready() -> void:
	add_to_group("Bullets")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.y += 5
	if position.y > 550:
		queue_free()
	if get_parent().gamePhase ==1:
		queue_free()
	if get_parent().gamePhase == 4:
		queue_free()
