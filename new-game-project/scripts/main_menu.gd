extends Control

var buttomSelected = 0
var part = 0
var charcterSelected = 0
var shotTypeSelected = 0
@onready var startOfGame = preload("res://stages/firstStage.tscn")

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
		$TimmyShotTypeSelection.visible = false
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
			
		if buttomSelected == 2 and Input.is_action_just_pressed("shoot"):
			get_tree().change_scene_to_file("res://ui/instructionn.tscn")
		if buttomSelected == 3 and Input.is_action_just_pressed("shoot"):
			get_tree().change_scene_to_file("res://ui/music_room.tscn")
		if buttomSelected == 4 and Input.is_action_just_pressed("shoot"):
			get_tree().quit()
	
		$firstpart/Knifee.position = Vector2(1254.0, 130 * buttomSelected + 394.0)
	if part == 1:
		
		$characterSelection.visible = true
		$Title.visible = false
		$firstpart.visible = false
		$TimmyShotTypeSelection.visible = false
		$RinSatsuki.visible = false
		await get_tree().create_timer(0.1).timeout
		if Input.is_action_just_pressed("right"):
			charcterSelected += 1
		if Input.is_action_just_pressed("left"):
			charcterSelected -= 1
		if charcterSelected < 0:
			charcterSelected = 2
		if charcterSelected > 2:
			charcterSelected = 0
		$characterSelection/Knifee.position = Vector2(233.0 + charcterSelected* 640, 990.0)
		if Input.is_action_just_pressed("Bomb"):
			part = 0
		if Input.is_action_just_pressed("shoot") and charcterSelected == 0:
			GlobalVariables.char = 1
			part = 2
		if Input.is_action_just_pressed("shoot") and charcterSelected == 2:
			GlobalVariables.char = 3
			part = 2
			
		
			
	if part == 2 and GlobalVariables.char == 1:
		$characterSelection.visible = false
		$Title.visible = false
		$firstpart.visible = false
		$TimmyShotTypeSelection.visible = true
		
		await get_tree().create_timer(0.1).timeout
		if Input.is_action_just_pressed("right"):
			shotTypeSelected+= 1
		if Input.is_action_just_pressed("left"):
			shotTypeSelected -= 1
		if shotTypeSelected < 0:
			shotTypeSelected = 1
		if shotTypeSelected > 1:
			shotTypeSelected = 0
		if shotTypeSelected == 0:
			$TimmyShotTypeSelection/stats1.text ="Beginner friendly,
			 focus fire"
			$TimmyShotTypeSelection/stats2.text = "Special: Increase
			 damage for your bullet"
		if shotTypeSelected == 1:
			$TimmyShotTypeSelection/stats1.text ="agressive, High-damage,
			 shreadshot"
			$TimmyShotTypeSelection/stats2.text = "Special: a bomb that
			 takes your power away"
		$TimmyShotTypeSelection/Knifee.position = Vector2(261+ shotTypeSelected* 640,890)
		if shotTypeSelected == 0 and Input.is_action_just_pressed("shoot"):
			GlobalVariables.shotType = 1
			$sceneTransition/AnimationPlayer.play("fade-Out")
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_file("res://stages/firstStage.tscn")
		if shotTypeSelected == 1 and Input.is_action_just_pressed("shoot"):
			GlobalVariables.shotType = 2
			$sceneTransition/AnimationPlayer.play("fade-Out")
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_file("res://stages/firstStage.tscn")
		if Input.is_action_just_pressed("Bomb"):
			part = 1
	if part == 2 and GlobalVariables.char == 3:
		shotTypeSelected = 0
		$characterSelection.visible = false
		$Title.visible = false
		$firstpart.visible = false
		$RinSatsuki.visible = true
		await get_tree().create_timer(0.1).timeout
		$RinSatsuki/stats1.text ="High damage AOE"
		$RinSatsuki/stats2.text = "Special: idk hurt Vmen ears tho"
		
		$TimmyShotTypeSelection/Knifee.position = Vector2(261,890)
		if shotTypeSelected == 0 and Input.is_action_just_pressed("shoot"):
			GlobalVariables.shotType = 1
			$sceneTransition/AnimationPlayer.play("fade-Out")
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_file("res://stages/firstStage.tscn")
		if Input.is_action_just_pressed("Bomb"):
			part = 1
