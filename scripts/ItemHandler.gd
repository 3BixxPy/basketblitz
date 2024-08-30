extends Node3D

@onready var fruit_spawn_timer = $"../FruitSpawnTimer"
@export var fruits: Node3D

var fruits_list = []
var delete_area = null

var max_left: float = -8.0
var max_right: float = 8.0

var fruit_speed = 4.0
var fruit_timer = 2.2
var fruit_timer_range = 1.5


func _ready():
	for child in fruits.get_children():
		fruits_list.append(child)
	
	fruit_spawn_timer.wait_time = fruit_timer

func restart():
	fruit_speed = 4.0
	fruit_timer = 2.2
	fruit_timer_range = 1.5
	
	for child in get_children():
		child.queue_free()

func get_random_fruit() -> StaticBody3D:
	var random_index = randi() % fruits_list.size()
	return fruits_list[random_index]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fruit_spawn_timer_timeout():
	if Global.is_game_paused:
		return
		
	var random_fruit = get_random_fruit()
	var fruit_clone = random_fruit.duplicate()
	
	var new_transform = self.transform.origin
	new_transform.x = randi_range(max_left, max_right)
	
	fruit_clone.transform.origin = new_transform
	fruit_clone.speed = fruit_speed
	add_child(fruit_clone)
	fruit_clone.start_fall()
	
	fruit_spawn_timer.wait_time = randf_range(
		fruit_timer_range, fruit_timer
		)


func _on_difficulty_timer_timeout():
	if fruit_timer > 0.8:
		fruit_timer -= 0.1
	
	if fruit_timer_range > 0.6:
		fruit_timer_range -= 0.1
	
	if fruit_speed < 18:
		fruit_speed += 1
