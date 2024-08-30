extends Node2D

@onready var music_player = $"../music"
@export var music: AudioStream = preload("res://assets/sounds/botw_minigame.ogg")
@onready var game = $"../game"
@onready var game_over = $"Game Over"

# Called when the node enters the scene tree for the first time.
func _ready():
	music_player.stream = music
	music_player.play()
	
	var viewport_width = get_viewport_rect().size.x
	position.x = viewport_width / 2

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Global.is_game_paused = not Global.is_game_paused
		game_over.visible = false
		self.visible = not self.visible
	
	
func _on_check_button_toggled(button_pressed):
	if button_pressed:
		music_player.play()
	else:
		music_player.stop()




func _on_restart_pressed():
	Global.is_game_paused = not Global.is_game_paused
	self.visible = not self.visible
