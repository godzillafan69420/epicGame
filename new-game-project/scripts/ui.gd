extends Control


@onready var panel = $dialog
@onready var barrySprite = $barryDialog
@onready var protagonistDialog = $Protagonist
@onready var textBox = $dialog/dialogText
const boris = preload("res://images/bogdan.png")
@onready var rinSpriteangry = preload("res://images/Rin even even better.png")
@onready var rinSprite = preload("res://images/Rin even even better.png")
@onready var gojo = preload("res://images/nahidWin.jpg")
@onready var Jimmy = preload("res://images/Unnamedcharacter.png")
var textToShow: int = 0
func _ready() -> void:
	$JimmySpecial.hide()

signal startTheBossMusic
func _process(_delta: float) -> void:
	$souls.text = str(GlobalVariables.souls)
	if GlobalVariables.communism == true:
		barrySprite.texture = boris
		if get_parent().gamePhase == 1:
			panel.visible = true
			barrySprite.visible = true
			if GlobalVariables.character == 1:
				if textToShow == 0:
					textBox.text = "what are ya doin'.
					why re ya throwing knifes."
				if textToShow == 1:
					textBox.text = "Why is everything communist"
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 2:
					textBox.text = "It's a good thing"
					barrySprite.visible = true
					protagonistDialog.visible = false
				if textToShow == 3:
					textBox.text = "... idk"
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 4:
					textBox.text = "Ok"
					barrySprite.visible = true
					protagonistDialog.visible = false
				if 	textToShow == 5:
					textBox.text = "Where is barrwee"
					barrySprite.visible = false
					protagonistDialog.visible = true
				
				if textToShow == 6:
					textBox.text = "He ran after the communist were attacking him"
					barrySprite.visible = true
					protagonistDialog.visible = false
				
				if textToShow == 7:
					textBox.text = "ok"
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
					why re ya throwing knifes."
				if textToShow == 1:
					textBox.text = "Why is everything communist"
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 2:
					textBox.text = "It's a good thing"
					barrySprite.visible = true
					protagonistDialog.visible = false
				if textToShow == 3:
					textBox.text = "... idk"
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 4:
					textBox.text = "Ok"
					barrySprite.visible = true
					protagonistDialog.visible = false
				if 	textToShow == 5:
					textBox.text = "Where is barrwee"
					barrySprite.visible = false
					protagonistDialog.visible = true
				
				if textToShow == 6:
					textBox.text = "He ran after the communist were attacking him"
					barrySprite.visible = true
					protagonistDialog.visible = false
				
				if textToShow == 7:
					textBox.text = "ok"
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 8:
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
					textBox.text = "what are ya doin'.
					"
				if textToShow == 1:
					textBox.text = "Nah I'd win"
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 2:
					textBox.text = "What?"
					barrySprite.visible = true
					protagonistDialog.visible = false
				if textToShow == 3:
					textBox.text = "Nah I'd win"
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 4:
					textBox.text = "I'm so confuse. Stop saying that"
					barrySprite.visible = true
					protagonistDialog.visible = false
				if 	textToShow == 5:
					textBox.text = "Nah I'd win"
					barrySprite.visible = false
					protagonistDialog.visible = true
				
				if textToShow == 6:
					textBox.text = "Thats it pal
					Imma beat you up using my abs.
					Reinforce by FREEDOM. *eagle sound*"
					barrySprite.visible = true
					protagonistDialog.visible = false
				
				if textToShow == 7:
					protagonistDialog.texture = gojo
					textBox.text = "Nah I'd win"
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 8:
					get_parent().gamePhase = 2
					textBox.text = ""
					barrySprite.visible = false
					protagonistDialog.visible = false
					panel.visible = false
					startTheBossMusic.emit()
			if GlobalVariables.character == 2:
				protagonistDialog.texture =Jimmy
				panel.visible = true
				barrySprite.visible = true
				if textToShow == 0:
					textBox.text = "what are ya doin'.
					why re ya throwing knifes."
				if textToShow == 1:
					textBox.text = "Why is everything communist"
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 2:
					textBox.text = "It's a good thing"
					barrySprite.visible = true
					protagonistDialog.visible = false
				if textToShow == 3:
					textBox.text = "... idk"
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 4:
					textBox.text = "Ok"
					barrySprite.visible = true
					protagonistDialog.visible = false
				if 	textToShow == 5:
					textBox.text = "Where is barrwee"
					barrySprite.visible = false
					protagonistDialog.visible = true
				
				if textToShow == 6:
					textBox.text = "He ran after the communist were attacking him"
					barrySprite.visible = true
					protagonistDialog.visible = false
				
				if textToShow == 7:
					textBox.text = "ok"
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
	else:
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
					textBox.text = "what are ya doin' 
					stop scaring away my customers.
					"
				if textToShow == 1:
					textBox.text = "Mb, do u know where is Barrwee"
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 2:
					textBox.text = "Thats me, pal"
					barrySprite.visible = true
					protagonistDialog.visible = false
				if textToShow == 3:
					textBox.text = "Ok thx. Can u die.
					For stealing that jet"
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
					textBox.text = "that is not a plane silly.
					However, If ya gonna git me. 
					You gotta get pass these abs.
					Reinforce by FREEDOM. *eagle sound*"
					barrySprite.visible = true
					protagonistDialog.visible = false
				
				if textToShow == 7:
					protagonistDialog.texture = rinSpriteangry
					textBox.text = "GGs little bro"
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 8:
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
					textBox.text = "what are ya doin'.
					"
				if textToShow == 1:
					textBox.text = "Nah I'd win"
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 2:
					textBox.text = "What?"
					barrySprite.visible = true
					protagonistDialog.visible = false
				if textToShow == 3:
					textBox.text = "Nah I'd win"
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 4:
					textBox.text = "I'm so confuse. Stop saying that"
					barrySprite.visible = true
					protagonistDialog.visible = false
				if 	textToShow == 5:
					textBox.text = "Nah I'd win"
					barrySprite.visible = false
					protagonistDialog.visible = true
				
				if textToShow == 6:
					textBox.text = "Thats it pal
					Imma beat you up using my abs.
					Reinforce by FREEDOM. *eagle sound*"
					barrySprite.visible = true
					protagonistDialog.visible = false
				
				if textToShow == 7:
					protagonistDialog.texture = gojo
					textBox.text = "Nah I'd win"
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 8:
					get_parent().gamePhase = 2
					textBox.text = ""
					barrySprite.visible = false
					protagonistDialog.visible = false
					panel.visible = false
					startTheBossMusic.emit()
			if GlobalVariables.character == 2:
				protagonistDialog.texture =Jimmy
				panel.visible = true
				barrySprite.visible = true
				if textToShow == 0:
					textBox.text = "Stop blasting lazer every where.
					What is this, independence day?"
				if textToShow == 1:
					textBox.text = "Stop with the US reference would ya.
					I haven't seen a nationalist like you since 1945 .
					Anyways you gotta go."
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 2:
					textBox.text = "For what !!!!!!"
					barrySprite.visible = true
					protagonistDialog.visible = false
				if textToShow == 3:
					textBox.text = "Stealing a plane. Are you stupid like that 
					shopkeeper
					"
					barrySprite.visible = false
					protagonistDialog.visible = true
				if textToShow == 4:
					textBox.text = "Noo"
					barrySprite.visible = true
					protagonistDialog.visible = false
				if 	textToShow == 5:
					textBox.text = "fair point this guy is way too stupid
					Come with me jail time"
					barrySprite.visible = false
					protagonistDialog.visible = true
				
				if textToShow == 6:
					textBox.text = "No cage can hold back my freedom
					bucko"
					barrySprite.visible = true
					protagonistDialog.visible = false
				
				if textToShow == 7:
					textBox.text = "Always with these nationalist
					Right Fred"
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
