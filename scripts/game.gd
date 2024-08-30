extends Node3D


@onready var item_handler = $ItemHandler
@onready var ui = $UI

func _on_restart_pressed():
	item_handler.restart()
	ui.reset_score()
	

func _on_quit_pressed():
	get_tree().quit()
