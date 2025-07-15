extends Control

var songSelected = 0
const title = preload("res://music/titleAndDeath.mp3")
const stage1 = preload("res://music/looping song.wav")
const barry = preload("res://music/barryToes.mp3")
const stage2 = preload("res://music/stage2.mp3")
const coneL = preload("res://music/coneL.mp3")
const shop = preload("res://music/scammingYourMoney.mp3")
const death = preload("res://music/death.mp3")
var paused = false
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("down"):
		songSelected += 1
	if Input.is_action_just_pressed("up"):
		songSelected -= 1
	if songSelected < 0:
		songSelected = 6
	if songSelected > 6:
		songSelected = 0
	$Knifee.position = Vector2(136, 150 * songSelected + 93.0)
	if Input.is_action_just_pressed("Bomb"):
		get_tree().change_scene_to_file("res://ui/main_menu.tscn")
	if songSelected == 0 and Input.is_action_just_pressed("shoot"):
		$player.stop()
		$player.stream = title
		$player.play()
	if songSelected == 1 and Input.is_action_just_pressed("shoot"):
		$player.stop()
		$player.stream = stage1
		$player.play()
	if songSelected == 2 and Input.is_action_just_pressed("shoot"):
		$player.stop()
		$player.stream = barry
		$player.play()
	if songSelected == 3 and Input.is_action_just_pressed("shoot"):
		$player.stop()
		$player.stream = stage2
		$player.play()
	if songSelected == 4 and Input.is_action_just_pressed("shoot"):
		$player.stop()
		$player.stream = coneL
		$player.play()
	if songSelected == 5 and Input.is_action_just_pressed("shoot"):
		$player.stop()
		$player.stream = shop
		$player.play()
	if songSelected == 6 and Input.is_action_just_pressed("shoot"):
		$player.stop()
		$player.stream = death
		$player.play()
