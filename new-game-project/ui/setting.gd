extends Control

func _ready() -> void:
	AudioServer.set_bus_mute(0,false)
	AudioServer.set_bus_volume_db(0, 0)
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
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
