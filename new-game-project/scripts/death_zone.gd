extends Area2D

class_name deathZone
var bg = preload("res://images/bgFor Stage1.png")
var bg2 = preload("res://images/coneLEvilbase.png")
var bg3 = preload("res://images/bananaBank.png")
var bg4 = preload("res://images/stage4bg.png")
func _on_timer_timeout() -> void:
	if GlobalVariables.character == 4:
		return
	if get_parent().gamePhase == 0:
		get_parent().get_node("LoopingSong").volume_db = 0
	else:
		get_parent().get_node("BarryToes").volume_db = 0
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is dangerousBalls:
		area.queue_free()
	if area is bulletToPlayer:
		area.queue_free()
	if area is  superBulletForBoss:
		area.queue_free()
	if area is  coolPatternBullet:
		area.queue_free()
