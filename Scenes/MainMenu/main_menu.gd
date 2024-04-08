extends Node
@export var GAME : PackedScene
@export var ResetButton: MarginContainer
@export var ResetModal: Panel

@onready var main = $CanvasLayer/Control/Main
@onready var control = $CanvasLayer/Control/Controls
@onready var credits = $CanvasLayer/Control/Credits

func _ready():
	back_to_main()

func start_game():
	get_tree().change_scene_to_packed(GAME)

# Return to the main menu from any submenu.
func back_to_main():
	main.visible = true
	control.visible = false
	credits.visible = false
	ResetButton.visible = Dialogic.Save.has_slot('Test')

func show_controls():
	main.visible = false
	control.visible = true

func show_credits():
	main.visible = false
	credits.visible = true

# Credits link handler
func link_clicked(href):
	OS.shell_open(href)

func hover_button():
	$HoverFX.play()

func click_button():
	$ClickFX.play()

func reset_save():
	Dialogic.Save.delete_slot('Test')
	hide_reset_modal()

func show_reset_modal():
	$CanvasLayer/Control/Main/VBoxContainer.visible = false
	ResetModal.visible = true

func hide_reset_modal():
	$CanvasLayer/Control/Main/VBoxContainer.visible = true
	ResetModal.visible = false
	back_to_main()
