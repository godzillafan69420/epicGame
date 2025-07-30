extends Control

var selectedItems: int = 0

func _ready() -> void:
	$sceneTransition.get_node("ColorRect").color.a = 255
	$sceneTransition/AnimationPlayer.play("fade - in")

func _on_button_button_down() -> void:
	if GlobalVariables.souls >= 50:
		GlobalVariables.PlayerHP +=1
		GlobalVariables.souls -= 50
	


func _on_button_2_button_down() -> void:
	if GlobalVariables.souls >= 25:
		GlobalVariables.playerBombs +=1
		GlobalVariables.souls -= 25


func _on_button_3_button_down() -> void:
	if GlobalVariables.souls >= 50:
		GlobalVariables.playerPower +=10
		GlobalVariables.souls -= 50
		
func _process(_delta: float) -> void:
	$souls.text = "Souls collected: " + str(GlobalVariables.souls)
	$HP.text = "HP: " + str(GlobalVariables.PlayerHP)
	if GlobalVariables.PlayerHP > 10:
		GlobalVariables.PlayerHP = 10
	$bombs.text = "Bombs: " + str(GlobalVariables.playerBombs)
	if GlobalVariables.playerBombs > 10:
		GlobalVariables.playerBombs = 10
	$Power.text = "power: " + str(GlobalVariables.playerPower)
	if GlobalVariables.playerPower > 100:
		GlobalVariables.playerPower = 100
	if Input.is_action_just_pressed("right"):
		selectedItems += 1
	if Input.is_action_just_pressed("left"):
		selectedItems -= 1
	if selectedItems > 2:
		selectedItems =0
	if selectedItems < 0:
		selectedItems = 2
	if selectedItems == 0 and Input.is_action_just_pressed("shoot"):
		if GlobalVariables.souls >= 50:
			GlobalVariables.PlayerHP +=1
			GlobalVariables.souls -= 50
	if selectedItems == 1 and Input.is_action_just_pressed("shoot"):
		if GlobalVariables.souls >= 25:
			GlobalVariables.playerBombs +=1
			GlobalVariables.souls -= 25
	if selectedItems == 2 and Input.is_action_just_pressed("shoot"):
		if GlobalVariables.souls >= 50:
			GlobalVariables.playerPower +=30
			GlobalVariables.souls -= 50
	$Knifee.position = Vector2(selectedItems * 610 + 297, 632)
	if Input.is_action_just_pressed("Bomb"):
		$sceneTransition/AnimationPlayer.play("fade-Out")
		await get_tree().create_timer(0.5).timeout
		if GlobalVariables.stage == 2:
			get_tree().change_scene_to_file("res://stages/stage_2.tscn")
		if GlobalVariables.stage == 3:
			get_tree().change_scene_to_file("res://stages/stage_3.tscn")
		if GlobalVariables.stage == 4:
			get_tree().change_scene_to_file("res://stages/stage_4.tscn")
