extends Control



@onready var panel = $dialog
@onready var barrySprite = $barryDialog
@onready var protagonistDialog = $Protagonist
@onready var textBox = $dialog/dialogText
@onready var rinSpriteangry =preload("res://images/Rin even even better.png")
@onready var rinSprite = preload("res://images/Rin even even better.png")
@onready var gojo = preload("res://images/nahidWin.jpg")
var textToShow: int = 0

signal startTheBossMusic
func _process(_delta: float) -> void:
	$souls.text = str(GlobalVariables.souls)
	if get_parent().gamePhase == 1:
		
		if GlobalVariables.character ==1:
			panel.visible = true
			barrySprite.visible = true
			if textToShow == 0:
				textBox.text = "Bro stop running around and throwing knifes
				everywhere
				Do you need a job?"
			if textToShow == 1:
				textBox.text = "Actually, I'm employed by the High Court of
				 The Underworld"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 2:
				textBox.text = "Don't lie"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 3:
				textBox.text = "-_- why would I lie"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 4:
				textBox.text = "You want to pick a fight with me boy"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 5:
				textBox.text = "Sure, I really really want to punch you"
				barrySprite.visible = false
				protagonistDialog.visible = true
			
			if textToShow == 6:
				textBox.text = "Nah I'd win"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 7:
				textBox.text = "*sign*"
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
				textBox.text = "Stop playing that despicable music.
				Listen to some classical music"
			if textToShow == 1:
				textBox.text = "No"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 2:
				textBox.text = "How dare you reject this offer.
				What are you unemployed"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 3:
				protagonistDialog.texture =rinSpriteangry
				textBox.text = "Yeah"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 4:
				textBox.text = "Then you need to be employed now.
				You are Disgusting"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 5:
				protagonistDialog.texture =rinSprite
				textBox.text = "No U"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 6:
				textBox.text = "What are these goofy ah responses
				Wait, where is all my goons?"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 7:
				protagonistDialog.texture =rinSprite
				textBox.text = "Their ear drums are burst open.
				Sorry sorry"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 8:
				textBox.text = "I will never forgive for this.
				They are my goons.
				I love them with all my heart and wish to be by their side
				all the time for enternity"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 9:
				textBox.text = ".....
				D:
				 
				"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 10:
				get_parent().gamePhase = 2
				textBox.text = ""
				barrySprite.visible = false
				protagonistDialog.visible = false
				panel.visible = false
				startTheBossMusic.emit()
		if GlobalVariables.character == 4:
			protagonistDialog.texture =gojo
			panel.visible = true
			barrySprite.visible = true
			if textToShow == 0:
				textBox.text = "Bro stop killing my goons"
			if textToShow == 1:
				textBox.text = "Nah I'd win"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 2:
				textBox.text = "what"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 3:
				protagonistDialog.texture =gojo
				textBox.text = "Nah I'd win"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 4:
				textBox.text = "bro stop"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 5:
				protagonistDialog.texture =gojo
				textBox.text = "Nah I'd win"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 6:
				textBox.text = "Can you say anything else other than that"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 7:
				protagonistDialog.texture =gojo
				textBox.text = "Nah I'd win"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 8:
				textBox.text = "STOOOP"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 9:
				textBox.text = "Nah I'd win"
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
