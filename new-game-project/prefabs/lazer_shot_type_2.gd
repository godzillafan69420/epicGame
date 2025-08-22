extends Area2D
class_name LazerShot2
@onready var bulletsPre =preload("res://prefabs/smallLazers.tscn")
func _process(_delta):
	position.y -= 25
	if position.y < -540:
		queue_free()
	if get_parent().gamePhase ==1:
		queue_free()


func _on_area_entered(area):
	if area is enemy:
		
		queue_free()
