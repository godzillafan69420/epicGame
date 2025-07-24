extends Area2D

class_name  Rinbulletno2
var dir: Vector2
var target:Object
var attacking: bool
var playerboody: Object
func _ready() -> void:
	attacking = false
	playerboody = get_parent().get_node("player")
func _process(delta: float) -> void:
	
	if attacking and target !=null:
		if target == null:
			attacking = false
		dir = target.position- position 
		position += dir.normalized() * 10
		
		
	else:
		dir = Vector2(0, -1)
		position += dir.normalized() * 10
	if position.y > 550  or position.y < -550:
		queue_free()
	if position.x > 410 or position.x < -950:
		queue_free()
	if get_parent().gamePhase == 4:
		queue_free()

		


func _on_area_2d_area_entered(area: Area2D) -> void:
	if (area is enemy or area is boss or area is bossNo2 or area is bossNo3 or area is  GuyShootTowardsYou or area is sideToSideEnemy) and attacking == false:
		target = area
		attacking = true
		
