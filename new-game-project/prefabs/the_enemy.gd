extends Area2D

class_name GuyShootTowardsYou

@onready var thePlayer = get_parent().find_child("player")
@onready var bulletPrefab = preload("res://prefabs/bullet_to_player.tscn")

func _ready():
	$Timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

	


func _on_timer_timeout():
	var bullets = bulletPrefab.instantiate()
	bullets.position = position
	bullets.theplayerDirtion = thePlayer.position-position
	get_parent().add_child(bullets)
