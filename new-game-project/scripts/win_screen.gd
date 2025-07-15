extends Control

func _process(delta: float) -> void:
	if $Node2D.position.y > -1800:
		$Node2D.position.y -= 1
