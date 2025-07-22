extends Control


@onready var panel = $dialog
@onready var barrySprite = $barryDialog
@onready var protagonistDialog = $Protagonist
@onready var textBox = $dialog/dialogText
@onready var rinSpriteangry = preload("res://images/Rin even even better.png")
@onready var rinSprite = preload("res://images/Rin even even better.png")
var textToShow = 0

signal startTheBossMusic
func _process(delta: float) -> void:
	$souls.text = str(GlobalVariables.souls)
	if get_parent().gamePhase == 1:
		
		if GlobalVariables.char ==1:
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
		if GlobalVariables.char == 3:
			protagonistDialog.texture =rinSprite
			panel.visible = true
			barrySprite.visible = true
			if textToShow == 0:
				textBox.text = "Why are you here?
			 Stop blasting phonk in this area there."
			if textToShow == 1:
				textBox.text = "Omg a monkey"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 2:
				textBox.text = "Yeah i am a monkey.
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
				textBox.text = "well your getting executed according to this.
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
		if Input.is_action_just_pressed("shoot"):
			textToShow +=1
