extends Node2D 

@onready var label = $Score
var score = 0
@onready var menu = $"../../Menu"

func _ready():
	
	# center label
	var parent_width = get_viewport_rect().size.x
	var label_width = label.size.x
	label.position.x = (parent_width - label_width) / 2.0

func reset_score():
	score = 0
	label.text = str(score)

func update_score(update_score_):
	score += update_score_
	
	if score < 0:
		menu.visible = true
		menu.game_over.visible = true
		Global.is_game_paused = true
		return
	
	label.text = str(score)
