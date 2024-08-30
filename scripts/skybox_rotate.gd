extends Node3D

@export var rotation_speed: float = 0.5
@export var max_rotation_angle: float = 25.0

var current_rotation: float = 0.0
var rotation_direction: int = 1

func _process(delta: float) -> void:
	var rotation_step = rotation_speed * delta * rotation_direction

	rotation.y += rotation_step * (PI / 180)
	current_rotation += rotation_step
	
	# reached max rot
	if abs(current_rotation) >= max_rotation_angle:
		rotation_direction *= -1
		current_rotation = clamp(current_rotation, -max_rotation_angle, max_rotation_angle)
