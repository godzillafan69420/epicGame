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
			textBox.text = "Can you stop attacking my goons
			It's really annoying and I am trying to
			ruin this kid's day"
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
			
		if Input.is_action_just_pressed("shoot"):
			textToShow +=1
