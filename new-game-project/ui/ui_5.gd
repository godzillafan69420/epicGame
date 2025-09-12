extends Control



@onready var panel = $dialog
@onready var barrySprite = $barryDialog
@onready var protagonistDialog = $Protagonist
@onready var textBox = $dialog/dialogText
@onready var rinSpriteangry =preload("res://images/Rin even even better.png")
@onready var rinSprite = preload("res://images/Rin even even better.png")
@onready var gojo = preload("res://images/nahidWin.jpg")
@onready var jimmy = preload("res://images/Unnamedcharacter.png")
var textToShow: int = 0
func _ready() -> void:
	$JimmySpecial.hide()
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
				textBox.text = "My job is to unemploy people"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 4:
				textBox.text = "
				You are Disgusting"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 5:
				protagonistDialog.texture =rinSprite
				textBox.text = "No U. who wants to be employed"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 6:
				textBox.text = "My goons and me. How dare you hurt my goons."
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 7:
				protagonistDialog.texture =rinSprite
				textBox.text = "MB for their ear drums are burst open."
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
		if GlobalVariables.character == 2:
			protagonistDialog.texture =jimmy
			panel.visible = true
			barrySprite.visible = true
			if textToShow == 0:
				textBox.text = "Bro stop killing my goons
				and get a  job"
			if textToShow == 1:
				textBox.text = "No for both.
				I have been working for 2000 years. 
				I still haven't got my retirement. 
				They really need to add a worker union 
				in the underworld"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 2:
				textBox.text = "Ok if your employed then I can leave 
				you alone"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 3:
				textBox.text = "Well, I have to kill you 
				as part of my job"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 4:
				textBox.text = "What kind of job is this
				"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 5:
				textBox.text = "I don't know"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 6:
				textBox.text = "Why am I getting executed for"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 7:
				textBox.text = "Being a nuisance to world peace"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 8:
				textBox.text = "Am I really a threat. All I want
				is employment in the world"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 9:
				textBox.text = "Yes and that is final."
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
