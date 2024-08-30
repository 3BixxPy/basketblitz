extends Node3D


var rotation_speed: float = 10.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation.y += rotation_speed * delta * (PI / 180)
