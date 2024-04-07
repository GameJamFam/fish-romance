extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	if Dialogic.Save.has_slot('Test'):
		Dialogic.Save.load('Test')
	else:
		Dialogic.start('1Day Intro')
