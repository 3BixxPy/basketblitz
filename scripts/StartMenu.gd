extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport_width = get_viewport_rect().size.x
	position.x = viewport_width / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/fruit_blitz.tscn")


func _on_quit_pressed():
	get_tree().quit()
