extends Node2D

var speed = 100

func _process(delta: float) -> void:
	position += transform.x * 200 * delta
	$Node2D.rotate(deg_to_rad(45)* delta) 
