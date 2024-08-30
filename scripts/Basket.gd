extends StaticBody3D

var max_left: float = -8.0
var max_right: float = 8.0

var speed: float = 25.0
var acceleration = 130.0
var current_speed = 5.0

var ui = null
var audio_streamer = null
@onready var particle = $GPUParticles3D
@export var pop_sound: AudioStream = preload("res://assets/sounds/pop.ogg")

func _ready():
	ui = get_tree().root.get_node("fruit_blitz/game/UI")
	audio_streamer = get_tree().root.get_node("fruit_blitz/AudioStreamPlayer")
	
func _process(delta: float) -> void:
	
	if Global.is_game_paused:
		return
	
	var move_direction: Vector3 = Vector3.ZERO
	var current_position: Vector3 = transform.origin
	
	
	# Check for input
	if Input.is_action_pressed("move_left") and current_position.x > max_left:
		move_direction.x -= 1
		
	if Input.is_action_pressed("move_right") and current_position.x < max_right:
		move_direction.x += 1
	
	if move_direction != Vector3.ZERO:
		current_speed += acceleration * delta
		current_speed = min(current_speed, speed)
	
	else:
		current_speed = 5.0
	
	move_direction = move_direction.normalized() * current_speed * delta
		
	translate(move_direction)
	
func _on_area_3d_body_entered(body):
	body.queue_free()
	ui.update_score(10)
	
	audio_streamer.stream = pop_sound
	audio_streamer.play()
	
	particle.emitting = true
