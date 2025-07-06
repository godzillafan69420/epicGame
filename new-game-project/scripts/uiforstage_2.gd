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
			textBox.text = "Erm, why you attacking my goons"
		if textToShow == 1:
			textBox.text = "Self-defence?"
			barrySprite.visible = false
			protagonistDialog.visible = true
		if textToShow == 2:
			textBox.text = "Ok....  why are you here then"
			barrySprite.visible = true
			protagonistDialog.visible = false
		if textToShow == 3:
			textBox.text = "To execute you for running a crime organisation silly"
			barrySprite.visible = false
			protagonistDialog.visible = true
		if textToShow == 4:
			textBox.text = "wait was I"
			barrySprite.visible = true
			protagonistDialog.visible = false
		if textToShow == 5:
			textBox.text = "you literally have goons"
			barrySprite.visible = false
			protagonistDialog.visible = true
			
		if textToShow == 6:
			textBox.text = "Oh right"
			barrySprite.visible = true
			protagonistDialog.visible = false
			
		if textToShow == 7:
			textBox.text = "the term memory"
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
