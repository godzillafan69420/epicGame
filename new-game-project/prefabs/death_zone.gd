extends Area2D

class_name deathZone

func _on_timer_timeout() -> void:
	if get_parent().gamePhase == 0:
		get_parent().get_node("LoopingSong").volume_db = 0
	else:
		get_parent().get_node("BarryToes").volume_db = 0
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is dangerousBalls or area is  bulletToPlayer or area is  superBulletForBoss or area is  coolPatternBullet:
		area.queue_free()
