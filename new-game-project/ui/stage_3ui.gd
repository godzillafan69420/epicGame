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
			textBox.text = "Why are you here?
			 I can't be dealing with this stuff you know"
		if textToShow == 1:
			textBox.text = "Well, I have Important
			business with you"
			barrySprite.visible = false
			protagonistDialog.visible = true
		if textToShow == 2:
			textBox.text = "About Bananas?"
			barrySprite.visible = true
			protagonistDialog.visible = false
		if textToShow == 3:
			textBox.text = "No, well sort of.
			You are getting executed for your silly banana scheme
			"
			barrySprite.visible = false
			protagonistDialog.visible = true
		if textToShow == 4:
			textBox.text = "Hold on i forgorrr what i did"
			barrySprite.visible = true
			protagonistDialog.visible = false
		if textToShow == 5:
			textBox.text = "I tell you basicly you overprice bananas
			and force every monkey to eat apples (disgusting)."
			barrySprite.visible = false
			protagonistDialog.visible = true
			
		if textToShow == 6:
			textBox.text = "Ok i See.
			I can I tell you a joke."
			barrySprite.visible = true
			protagonistDialog.visible = false
			
		if textToShow == 7:
			textBox.text = "Erm, ok what is it."
			barrySprite.visible = false
			protagonistDialog.visible = true
		if textToShow == 8:
			textBox.text = "Chicken Butt"
			barrySprite.visible = true
			protagonistDialog.visible = false
			
		if textToShow == 9:
			textBox.text = "I am gonna kill you"
			barrySprite.visible = false
			protagonistDialog.visible = true
		if textToShow == 10:
			get_parent().gamePhase = 2
			textBox.text = ""
			barrySprite.visible = false
			protagonistDialog.visible = false
			panel.visible = false
			startTheBossMusic.emit()
			
		if Input.is_action_just_pressed("shoot"):
			textToShow +=1
