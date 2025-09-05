extends Control

var bgcode :int
var dummy = false
var buttomSelected: int = 0
var part: int = 5
var charcterSelected: int = 0
var shotTypeSelected: int  = 0
const back1 = preload("res://images/bg1.png")
const back2 = preload("res://images/bg2.png")
const back3 = preload("res://images/bgs-3.png.png")
const back4 = preload("res://images/bgs-4.png")
const back5 = preload("res://images/bgs-5.png (1).png")
const back6 = preload("res://images/bgs-6.png.png")
const back7 = preload("res://images/bgs-7.png.png")
const back8 = preload("res://images/bgs-8.png.png")
@onready var startOfGame = preload("res://stages/firstStage.tscn")
func _ready() -> void:
	
	bgcode = randi_range(1,7)
	if bgcode == 1:
		$Background.texture = back1
	if bgcode == 2:
		$Background.texture = back2
	if bgcode == 3:
		$Background.texture = back3
	if bgcode == 4:
		$Background.texture = back4
	if bgcode == 5:
		$Background.texture = back5
	if bgcode == 6:
		$Background.texture = back6
	if bgcode == 7:
		$Background.texture = back7
	if bgcode == 8:
		$Background.texture = back8
	await get_tree().create_timer(1.5).timeout
	part = 0
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Bomb"):
		$SeCancel00.play()
	if Input.is_action_just_pressed("shoot"):
		$SeSelect00.play()
	if Input.is_action_just_pressed("down") or Input.is_action_just_pressed("up") or Input.is_action_just_pressed("left")or Input.is_action_just_pressed("right"):
		$SeSlash.play()
	if part == 0:
		if Input.is_action_just_pressed("Bomb"):
			dummy = false
			$"how move in the main menu".visible = false
			$Title.visible = true
			$firstpart.visible = true
		$loadingScreen.visible = false
		if dummy == false:
			$Title.visible = true
			$firstpart.visible = true
		$characterSelection.visible = false
		$TimmyShotTypeSelection.visible = false
		if Input.is_action_just_pressed("down"):
			buttomSelected += 1
		if Input.is_action_just_pressed("up"):
			buttomSelected -= 1
		if buttomSelected < 0:
			buttomSelected = 5
		if buttomSelected > 5:
			buttomSelected = 0
		if buttomSelected == 0 and Input.is_action_just_pressed("shoot"):
			part = 1
		
		if buttomSelected == 3 and Input.is_action_just_pressed("shoot"):
			get_tree().change_scene_to_file("res://ui/instructionn.tscn")
		if buttomSelected == 2 and Input.is_action_just_pressed("shoot"):
			get_tree().change_scene_to_file("res://ui/setting.tscn")
		if buttomSelected == 4 and Input.is_action_just_pressed("shoot"):
			get_tree().change_scene_to_file("res://ui/music_room.tscn")
		if buttomSelected == 5 and Input.is_action_just_pressed("shoot"):
			get_tree().quit()
	
		$firstpart/Knifee.position = Vector2(1254.0, 130 * buttomSelected + 264.0)
	if part == 1:
		dummy = false
		$"how move in the main menu".visible = false
		$characterSelection.visible = true
		$Title.visible = false
		$firstpart.visible = false
		$TimmyShotTypeSelection.visible = false
		$RinSatsuki.visible = false
		$Jimmy.visible = false
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
			GlobalVariables.character = 1
			part = 2
		if Input.is_action_just_pressed("shoot") and charcterSelected == 1:
			GlobalVariables.character = 2
			part = 2
		if Input.is_action_just_pressed("shoot") and charcterSelected == 2:
			GlobalVariables.character = 3
			part = 2
			
		if Input.is_action_just_pressed("slowDown"):
			GlobalVariables.character = 4
			$sceneTransition/AnimationPlayer.play("fade-Out")
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_packed(startOfGame)
			
			
	if part == 2:
		$Background.modulate = Color8(1,1,1,255)
	else:
		$Background.modulate = Color8(157,157,157,255)
	if part == 2 and GlobalVariables.character == 1:
		$characterSelection.visible = false
		$Title.visible = false
		$firstpart.visible = false
		$TimmyShotTypeSelection.visible = true
		$Jimmy.visible = false
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
			 focus fire."
			$TimmyShotTypeSelection/stats2.text = "Special: Increase
			 damage for your bullet"
		if shotTypeSelected == 1:
			$TimmyShotTypeSelection/stats1.text ="Agressive, High-damage,
			 shreadshot."
			$TimmyShotTypeSelection/stats2.text = "Special: a bomb that
			 takes away your power away"
		$TimmyShotTypeSelection/Knifee.position = Vector2(261+ shotTypeSelected* 640,890)
		if shotTypeSelected == 0 and Input.is_action_just_pressed("shoot"):
			GlobalVariables.shotType = 1
			$sceneTransition/AnimationPlayer.play("fade-Out")
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_packed(startOfGame)
		if shotTypeSelected == 1 and Input.is_action_just_pressed("shoot"):
			GlobalVariables.shotType = 2
			$sceneTransition/AnimationPlayer.play("fade-Out")
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_packed(startOfGame)
		if Input.is_action_just_pressed("Bomb"):
			part = 1
	if part == 2 and GlobalVariables.character == 3:

		$characterSelection.visible = false
		$Title.visible = false
		$firstpart.visible = false
		$RinSatsuki.visible = true
		$Jimmy.visible = false
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
			$RinSatsuki/stats1.text ="High damage AOE, hurts Vmen
			ears when they listen >:3"
			$RinSatsuki/stats2.text = "Special: Trojan Horse "
		if shotTypeSelected == 1:
			$RinSatsuki/stats1.text ="Beginner friendly, Currupted 
			Job Aplication attacks!"
			$RinSatsuki/stats2.text = "Special:  Trojan Horse."
		$RinSatsuki/Knifee.position = Vector2(261+ shotTypeSelected* 640,890)
		if shotTypeSelected == 0 and Input.is_action_just_pressed("shoot"):
			GlobalVariables.shotType = 1
			$sceneTransition/AnimationPlayer.play("fade-Out")
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_packed(startOfGame)
		if shotTypeSelected == 1 and Input.is_action_just_pressed("shoot"):
			GlobalVariables.shotType = 2
			$sceneTransition/AnimationPlayer.play("fade-Out")
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_packed(startOfGame)
		if Input.is_action_just_pressed("Bomb"):
			
			part = 1
	if part == 2 and GlobalVariables.character == 2:
		$characterSelection.visible = false
		$Title.visible = false
		$firstpart.visible = false
		$RinSatsuki.visible = false
		$Jimmy.visible = true
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
			$Jimmy/stats1.text ="SuperBright lazer hurt
			peoples eyes"
			$Jimmy/stats2.text = "Special: Very painful ball of
			light"
		if shotTypeSelected == 1:
			$Jimmy/stats1.text ="Explosive Lazer"
			$Jimmy/stats2.text = "Special: Very painful ball of
			 light"
		$Jimmy/Knifee.position = Vector2(261+ shotTypeSelected* 640,890)
		if shotTypeSelected == 0 and Input.is_action_just_pressed("shoot"):
			GlobalVariables.shotType = 1
			$sceneTransition/AnimationPlayer.play("fade-Out")
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_packed(startOfGame)
		if shotTypeSelected == 1 and Input.is_action_just_pressed("shoot"):
			GlobalVariables.shotType = 2
			$sceneTransition/AnimationPlayer.play("fade-Out")
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_packed(startOfGame)
		if Input.is_action_just_pressed("Bomb"):
			
			part = 1

	


func _on_start_pressed() -> void:
	dummy = true
	$"how move in the main menu".visible = true
	$Title.visible = false
	$firstpart.visible = false
