extends Control

func _ready() -> void:
	AudioServer.set_bus_mute(0,false)
	AudioServer.set_bus_volume_db(0, 0)
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	GlobalVariables.communism = false
	GlobalVariables.CameraShake = true
	GlobalVariables.enemyParticles = true
	$MarginContainer/VBoxContainer/CheckBox4.button_pressed = true
	$MarginContainer/VBoxContainer/CheckBox3.button_pressed = true
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Bomb"):
		
		get_tree().change_scene_to_file("res://ui/main_menu.tscn")
func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)
	


func _on_check_box_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,toggled_on)


func _on_vsync_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		1:
			DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)


func _on_check_box_2_toggled(toggled_on: bool) -> void:
	GlobalVariables.communism = toggled_on


func _on_check_box_3_toggled(toggled_on: bool) -> void:
	GlobalVariables.CameraShake = toggled_on


func _on_check_box_4_toggled(toggled_on: bool) -> void:
	GlobalVariables.enemyParticles = toggled_on


func _on_option_button_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
