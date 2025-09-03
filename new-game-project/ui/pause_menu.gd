extends Control
var selectedButton = 0
func _ready() -> void:
	hide()
func resume():
	$AnimationPlayer.play_backwards("blur")
	await get_tree().create_timer(0.3).timeout
	hide()
	get_tree().paused = false
	
func pause():

	show()
	$AnimationPlayer.play("blur")
	get_tree().paused = true
	
func testEsc():
	if Input.is_action_just_pressed("MainMenu") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("MainMenu") and get_tree().paused == true:
		resume()
		
func _process(delta: float) -> void:
	testEsc()
	if get_tree().paused == false:
		return
	if Input.is_action_just_pressed("down"):
		selectedButton += 1
	if Input.is_action_just_pressed("up"):
		selectedButton -= 1
	if selectedButton > 2:
		selectedButton = 0
	if selectedButton < 0:
		selectedButton = 2
	if selectedButton == 0 and Input.is_action_just_pressed("shoot"):
		resume()
		
	if selectedButton == 1 and Input.is_action_just_pressed("shoot"):
		resume()
		await get_tree().create_timer(0.3).timeout
		GlobalVariables.playerBombs = 4
		GlobalVariables.PlayerHP = 3
		GlobalVariables.playerPower = 20
		GlobalVariables.souls = 10
		GlobalVariables.score = 0
		get_tree().change_scene_to_file("res://stages/firstStage.tscn")
	if selectedButton == 2 and Input.is_action_just_pressed("shoot"):
		resume()
		await get_tree().create_timer(0.3).timeout
		GlobalVariables.playerBombs = 4
		GlobalVariables.PlayerHP = 3
		GlobalVariables.playerPower = 20
		GlobalVariables.souls = 10
		GlobalVariables.score = 0
		get_tree().change_scene_to_file("res://ui/main_menu.tscn")
	$Knifee.position = Vector2(709.0,361.0+ selectedButton* 200)
