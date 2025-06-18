extends Area2D

class_name boss


var Hitpoint = 150000
var count = 0
var bossPhase = 1
signal changeAttacz
@onready var thePlayer = get_parent().find_child("player")
@onready var bulletPrefab = preload("res://prefabs/bullet_to_player.tscn")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Hitpoint < 0:
		queue_free()
	if bossPhase == 0:
		print("waiting")
	
	if bossPhase == 1 and count != 1:
		$BossShotgunInterval.start()
		count = 1
	if bossPhase == 2 and count != 1:
		$bulletShootinEverywhere.start()
		count = 1
	if Hitpoint < 50000:
		bossPhase = 2
	
	



		


func _on_area_entered(area: Area2D) -> void:
	if area is bullet:
		Hitpoint -= 7.5
		area.queue_free()
	if area is superAttack:
		Hitpoint -= 20
		area.queue_free()





func _on_boss_shotgun_interval_timeout() -> void:
	for i in range(-10,10):
		if thePlayer != null:
			var bullets = bulletPrefab.instantiate()
			bullets.position = position
			bullets.theplayerDirtion = thePlayer.position+Vector2(50*i,0)-position
			get_parent().add_child(bullets)
	count =0
	
	
	
	


func _on_change_attack() -> void:
	bossPhase += 1


func _on_shoot_towards_the_player_timeout() -> void:
	var bullets = bulletPrefab.instantiate()
	bullets.position = position
	bullets.theplayerDirtion = thePlayer.position-position
	get_parent().add_child(bullets)


func _on_slower_shotgun_timeout() -> void:
	for i in range(100):
		if thePlayer != null:
			var bullets = bulletPrefab.instantiate()
			bullets.position = position
			bullets.theplayerDirtion = Vector2(randf_range(-100,100),randf_range(-100,100))
			get_parent().add_child(bullets)
	count =0
