extends Control

var selectedItems = 0


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
		
func _process(delta: float) -> void:
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
			GlobalVariables.playerPower +=10
			GlobalVariables.souls -= 50
	$Knifee.position = Vector2(selectedItems * 610 + 297, 632)
	if Input.is_action_just_pressed("Bomb"):
		get_tree().change_scene_to_file("res://stages/stage_2.tscn")
