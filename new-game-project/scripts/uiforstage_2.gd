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
				textBox.text = "Can you stop attacking my goons
				I am trying to ruin this kid's day"
			if textToShow == 1:
				textBox.text = "Actually, I'm here to 
			executed by the High Judge of the Underworld."
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 2:
				textBox.text = "For what"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 3:
				textBox.text = "You literally terrorised so many
			children that they have chronic depression"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 4:
				textBox.text = "It's honestly it's not that deep on gigidy"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 5:
				textBox.text = "....
			Be serious"
				barrySprite.visible = false
				protagonistDialog.visible = true
			
			if textToShow == 6:
				textBox.text = "Ok, Ok my bad. But beat
				me in a 1v1 little bro and if I win I get spared"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 7:
				textBox.text = "... You ain't winning"
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
				textBox.text = "Can you stop attacking my goons
				I am trying to ruin this kid's day"
			if textToShow == 1:
				textBox.text = "Sorry, self-defence"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 2:
				textBox.text = "...
				Ok. Why are you in my base"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 3:
				protagonistDialog.texture =rinSpriteangry
				textBox.text = "Too kill ConeL :)"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 4:
				textBox.text = "Oh Conel is not here today"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 5:
				protagonistDialog.texture =rinSprite
				textBox.text = ".... nice try"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 6:
				textBox.text = "Ok fine, why am i getting killed for"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 7:
				protagonistDialog.texture =rinSprite
				textBox.text = "Cyber-bullying children"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 8:
				textBox.text = "FLyingDavid67 actually hire a hitman
				to kill me is crazy"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 9:
				textBox.text = "Vro come on
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
				textBox.text = "Can you stop attacking my goons
				I am trying to ruin this kid's day"
			if textToShow == 1:
				textBox.text = "Nah I'd win"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 2:
				textBox.text = "....
				Wait it's gojo"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 3:
				protagonistDialog.texture =gojo
				textBox.text = "Nah I'd win"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 4:
				textBox.text = "OMG big fan"
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
				textBox.text = "... You fake I think"
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
				textBox.text = "Really wish they add dark mode into real life
				These lazer of yours really hurt my eyes"
			if textToShow == 1:
				textBox.text = "You kids these days really need to touch some
				grass"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 2:
				textBox.text = "Whatever gramps"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 3:
				textBox.text = "Any time for you to go"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 4:
				textBox.text = "For what beating FlyingDavid67 in tsb.
				That kid raging in vc was so funny"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 5:
				textBox.text = "Stop the yap"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 6:
				textBox.text = "Ok fine can I just sent the clip to 
				the basement"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 7:
				textBox.text = "Sure make it quick"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 8:
				textBox.text = "OK"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 9:
				get_parent().gamePhase = 2
				textBox.text = ""
				barrySprite.visible = false
				protagonistDialog.visible = false
				panel.visible = false
				startTheBossMusic.emit()
		if Input.is_action_just_pressed("shoot"):
			textToShow +=1
