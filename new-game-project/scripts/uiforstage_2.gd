extends Control


@onready var panel = $dialog
@onready var barrySprite = $barryDialog
@onready var protagonistDialog = $Protagonist
@onready var textBox = $dialog/dialogText
@onready var rinSpriteangry = preload("res://images/RinBetter.png")
@onready var rinSprite = preload("res://images/RinBetter.png")
var textToShow = 0

signal startTheBossMusic
func _process(delta: float) -> void:
	$souls.text = str(GlobalVariables.souls)
	if get_parent().gamePhase == 1:
		
		if GlobalVariables.char ==1:
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
				textBox.text = "Bro, i'm sorry that these kids are
			that bad at the game"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 5:
				textBox.text = "....
			You think sorry is enough"
				barrySprite.visible = false
				protagonistDialog.visible = true
			
			if textToShow == 6:
				textBox.text = "Ok, Ok my bad"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 7:
				textBox.text = "Mortals these days"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 8:
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
				textBox.text = "Can you stop attacking my goons
				I am trying to ruin this kid's day"
			if textToShow == 1:
				textBox.text = "I'm looking for ConeL, I'm trying to execute him"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 2:
				textBox.text = "....
				hmmmmmmmmm
				I don't know where he is"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 3:
				protagonistDialog.texture =rinSpriteangry
				textBox.text = "Ok I see....
				
				Hold on your ConeL"
				barrySprite.visible = false
				protagonistDialog.visible = true
			if textToShow == 4:
				textBox.text = "Damn you saw through
				
				why am i getting executed"
				barrySprite.visible = true
				protagonistDialog.visible = false
			if textToShow == 5:
				protagonistDialog.texture =rinSprite
				textBox.text = "....
			You cyberbully children til they are chronically depress"
				barrySprite.visible = false
				protagonistDialog.visible = true
			
			if textToShow == 6:
				textBox.text = "I don't really care those nerds.
				Tooo EZ"
				barrySprite.visible = true
				protagonistDialog.visible = false
			
			if textToShow == 7:
				textBox.text = "Cold"
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
