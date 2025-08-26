extends Control


@onready var panel = $dialog
@onready var barrySprite = $barryDialog
@onready var protagonistDialog = $Protagonist
@onready var textBox = $dialog/dialogText
@onready var rinSpriteangry = preload("res://images/Rin even even better.png")
@onready var rinSprite = preload("res://images/Rin even even better.png")
@onready var gojo = preload("res://images/nahidWin.jpg")
@onready var jimmy = preload("res://images/Unnamedcharacter.png")
var textToShow: int = 0

signal startTheBossMusic
func _process(_delta: float) -> void:
	$souls.text = str(GlobalVariables.souls)
	if get_parent().gamePhase == 1:
		
		if GlobalVariables.character ==1:
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
				textBox.text = "I'm gonna kill you"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 10:
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
				textBox.text = "Why are you here?
			 Stop blasting Music in this area there."
			if textToShow == 1:
				textBox.text = "Errrm No"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 2:
				textBox.text = "Why? 
				"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 3:
				textBox.text = "I'm looking for a monkey called Rack
			"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 4:
				textBox.text = "Thats me"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 5:
				textBox.text = "The one that controls all the bananas in the world"
				barrySprite.visible = false
				protagonistDialog.visible = true
			
			if textToShow == 6:
				textBox.text = "yeah.
				wait, why you ask"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 7:
				textBox.text = "well ur getting executed because
				all the moneky are straving because of your goofy monopoly.
				"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 8:
				textBox.text = ":o
				Before you do. Let me tell you a joke. If you laugh 
				you spare me"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 9:
				textBox.text = "Ok"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 10:
				textBox.text = "guess what"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 11:
				textBox.text = "what"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 12:
				textBox.text = "Chicken - butt"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 13:
				textBox.text = ".... No
				That is so bad
				"
				barrySprite.visible = false
				protagonistDialog.visible = true
			
			if textToShow == 14:
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
				textBox.text = "Why are you here?
			 Wait it's Gojo"
			if textToShow == 1:
				textBox.text = "Nah I'd win"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 2:
				textBox.text = "?
				"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 3:
				textBox.text = "Nah I'd win"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 4:
				textBox.text = "I think this a bot"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 5:
				textBox.text = "Nah I'd win"
				barrySprite.visible = false
				protagonistDialog.visible = true
			
			if textToShow == 6:
				textBox.text = "Can you stop"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 7:
				textBox.text = "Nah I'd win"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 8:
				textBox.text = "If I make you laugh, stop saying Nah I'd win"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 9:
				textBox.text = "Nah I'd win"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 10:
				textBox.text = "guess what"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 11:
				textBox.text = "Nah I'd win"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 12:
				textBox.text = "Chicken - butt"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 13:
				textBox.text = "Through Heavens and earth I alone am 
				truely the Honour one
				Imaginary technique Purple
				"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 14:
				textBox.text = "I made it worst huh"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 15:
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
				textBox.text = "Ahhh my weakness light"
			if textToShow == 1:
				textBox.text = "What is wrong with everyone in this period
				Why are they allergic to light"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 2:
				textBox.text = "... Video games?
				"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 3:
				textBox.text = "What is that crap."
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 4:
				textBox.text = "Um hard to explain"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 5:
				textBox.text = "Geez, anyways you gotta go ya bum"
				barrySprite.visible = false
				protagonistDialog.visible = true
			
			if textToShow == 6:
				textBox.text = "D: What did I do?"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 7:
				textBox.text = "Monopoly on bananas.
				Forcing every monkey to eat apples"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 8:
				textBox.text = "If I make you laugh
				 you will for get my crimes"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 9:
				textBox.text = "Bet"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 10:
				textBox.text = "guess what"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 11:
				textBox.text = "What"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 12:
				textBox.text = "Chicken butt!"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 13:
				textBox.text = "....
				PREPARE THYSELF, JUDGEMENT, CRUSH, DIE, WEAK, THY END IS NOW.
				"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 14:
				textBox.text = "I thought it would work this time.
				"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 15:
				get_parent().gamePhase = 2
				textBox.text = ""
				barrySprite.visible = false
				protagonistDialog.visible = false
				panel.visible = false
				startTheBossMusic.emit()
		if Input.is_action_just_pressed("shoot"):
			textToShow +=1
