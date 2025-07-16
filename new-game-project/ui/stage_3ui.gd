extends Control


@onready var panel = $dialog
@onready var barrySprite = $barryDialog
@onready var protagonistDialog = $Protagonist
@onready var textBox = $dialog/dialogText

var textToShow = 0

signal startTheBossMusic
func _process(delta: float) -> void:
	$souls.text = str(GlobalVariables.souls)
	if get_parent().gamePhase == 1:
		panel.visible = true
		barrySprite.visible = true
		
		if textToShow == 0:
			textBox.text = "Umm this is a private property
			Can you leave"
		if textToShow == 1:
			textBox.text = "No, I have Important
			business with you"
			barrySprite.visible = false
			protagonistDialog.visible = true
		if textToShow == 2:
			textBox.text = "Bananas?"
			barrySprite.visible = true
			protagonistDialog.visible = false
		if textToShow == 3:
			textBox.text = "No, well sort of.
			You are getting executed for your
			silly banana scheme"
			barrySprite.visible = false
			protagonistDialog.visible = true
		if textToShow == 4:
			textBox.text = "Well before you execute me
			Can I tell you a joke"
			barrySprite.visible = true
			protagonistDialog.visible = false
		if textToShow == 5:
			textBox.text = "....
			That is a weird request.
			Ok what."
			barrySprite.visible = false
			protagonistDialog.visible = true
			
		if textToShow == 6:
			textBox.text = "Chicken-butt"
			barrySprite.visible = true
			protagonistDialog.visible = false
			
		if textToShow == 7:
			textBox.text = "well I am laughing my so hard
			that I am not laughing"
			barrySprite.visible = false
			protagonistDialog.visible = true
		if textToShow == 8:
			get_parent().gamePhase = 2
			textBox.text = ""
			barrySprite.visible = false
			protagonistDialog.visible = false
			panel.visible = false
			startTheBossMusic.emit()
			
		if Input.is_action_just_pressed("shoot"):
			textToShow +=1
