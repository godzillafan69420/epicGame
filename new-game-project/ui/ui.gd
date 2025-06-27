extends Control

@onready var panel = $dialog
@onready var barrySprite = $barryDialog
@onready var protagonistDialog = $Protagonist
@onready var textBox = $dialog/dialogText

var textToShow = 0

signal startTheBossMusic
func _process(delta: float) -> void:
	if get_parent().gamePhase == 1:
		panel.visible = true
		barrySprite.visible = true
		
		if textToShow == 0:
			textBox.text = "what are ya doin' in ma gun store"
		if textToShow == 1:
			textBox.text = "Barrwee Toes, you have been order 
			to be executed by the High Judge of the Underworld."
			barrySprite.visible = false
			protagonistDialog.visible = true
		if textToShow == 2:
			textBox.text = "Well that's it folks. 
			
			Time to give this saphead a beating he'll neva forget"
			barrySprite.visible = true
			protagonistDialog.visible = false
		if textToShow == 3:
			textBox.text = "Why do you have to do this."
			barrySprite.visible = false
			protagonistDialog.visible = true
		if textToShow == 4:
			get_parent().gamePhase = 2
			textBox.text = ""
			barrySprite.visible = false
			protagonistDialog.visible = false
			panel.visible = false
			startTheBossMusic.emit()
		if Input.is_action_just_pressed("shoot"):
			textToShow +=1
