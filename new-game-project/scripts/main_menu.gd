extends Control

var buttomSelected = 0
var part = 0

	
func _on_start_button_down() -> void:
	$sceneTransition/AnimationPlayer.play("fade-Out")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://stages/firstStage.tscn")


func _on_instructions_button_down() -> void:
	get_tree().change_scene_to_file("res://ui/instructionn.tscn")


func _on_quit_button_down() -> void:
	get_tree().quit()


func _on_music_room_button_down() -> void:
	get_tree().change_scene_to_file("res://ui/music_room.tscn")

func _process(delta: float) -> void:
	if part == 0:
		$Title.visible = true
		$firstpart.visible = true
		$characterSelection.visible = false
		if Input.is_action_just_pressed("down"):
			buttomSelected += 1
		if Input.is_action_just_pressed("up"):
			buttomSelected -= 1
		if buttomSelected < 0:
			buttomSelected = 4
		if buttomSelected > 4:
			buttomSelected = 0
		if buttomSelected == 0 and Input.is_action_just_pressed("shoot"):
			part = 1
			$sceneTransition/AnimationPlayer.play("fade-Out")
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_file("res://stages/firstStage.tscn")
		if buttomSelected == 2 and Input.is_action_just_pressed("shoot"):
			get_tree().change_scene_to_file("res://ui/instructionn.tscn")
		if buttomSelected == 3 and Input.is_action_just_pressed("shoot"):
			get_tree().change_scene_to_file("res://ui/music_room.tscn")
		if buttomSelected == 4 and Input.is_action_just_pressed("shoot"):
			get_tree().quit()
	
		$firstpart/Knifee.position = Vector2(1254.0, 130 * buttomSelected + 394.0)
	if part == 1:
		$characterSelection.visible = true
		
		
