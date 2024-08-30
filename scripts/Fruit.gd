extends StaticBody3D

var active = false
var speed = 10.0
var ui = null

func _ready():
	ui = get_tree().root.get_node("fruit_blitz/game/UI")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Global.is_game_paused:
		return
	
	if active:
		var move_amount = speed * delta
		translate(Vector3(0, -move_amount, 0))
	
	
	if transform.origin.y <= -15:
		queue_free()
		ui.update_score(-50)
	

func start_fall():
	active = true
	

