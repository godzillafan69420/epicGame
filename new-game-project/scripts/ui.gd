extends Control


@onready var panel = $dialog
@onready var barrySprite = $barryDialog
@onready var protagonistDialog = $Protagonist
@onready var textBox = $dialog/dialogText
@onready var rinSpriteangry = preload("res://images/Rin even even better.png")
@onready var rinSprite = preload("res://images/Rin even even better.png")
var textToShow: int = 0

signal startTheBossMusic
func _process(delta: float) -> void:
	$souls.text = str(GlobalVariables.souls)
	if get_parent().gamePhase == 1:
		panel.visible = true
		barrySprite.visible = true
		if GlobalVariables.character == 1:
			if textToShow == 0:
				textBox.text = "what are ya doin'.
				why re ya throwing knifes."
			if textToShow == 1:
				textBox.text = "Barrwee Toes, you have been order 
				to be executed by the High Judge of the Underworld."
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 2:
				textBox.text = "whaaat did i do"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 3:
				textBox.text = "Erm, you stole that plane over there"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 4:
				textBox.text = "Did not"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if 	textToShow == 5:
				textBox.text = "It's so obvious that you did"
				barrySprite.visible = false
				protagonistDialog.visible = true
			
			if textToShow == 6:
				textBox.text = "Fine
				If ya gonna git me. 
				You gotta get pass these abs.
				Reinforce by FREEDOM. *eagle sound*"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 7:
				textBox.text = "I don't get paid enough for this"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 8:
				get_parent().gamePhase = 2
				textBox.text = ""
				barrySprite.visible = false
				protagonistDialog.visible = false
				panel.visible = false
				startTheBossMusic.emit()
		if GlobalVariables.character == 3:
			protagonistDialog.texture =rinSprite
			panel.visible = true
			barrySprite.visible = true
			if textToShow == 0:
				textBox.text = "what are ya doin'.
				"
			if textToShow == 1:
				textBox.text = "Do you know where is barry"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 2:
				textBox.text = "Thats me "
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 3:
				textBox.text = "I will have to execute you.
				As you stole that plane over there"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 4:
				textBox.text = "Did not"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if 	textToShow == 5:
				textBox.text = "It's right there tho"
				barrySprite.visible = false
				protagonistDialog.visible = true
			
			if textToShow == 6:
				textBox.text = "Thats not a plane silly.
				However, If ya gonna git me. 
				You gotta get pass these abs.
				Reinforce by FREEDOM. *eagle sound*"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 7:
				protagonistDialog.texture = rinSpriteangry
				textBox.text = "Sure"
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
