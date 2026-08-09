extends Node2D

const BOUNDARY_LIMIT: float = 859.0
const DELAY_SPAWN_TIME: float = 5.0

@export var PositionNodes: Node2D
@export var CarScenes: Array[PackedScene]

var positions: Array[Vector2] = []

var timer: float = 0.0

var can_spawn_cars: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for marker in PositionNodes.get_children():
		positions.append(marker.global_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	
	if timer > DELAY_SPAWN_TIME and can_spawn_cars:
		timer = 0
		spawn_random_car()


func spawn_random_car() -> void:
	var car = CarScenes.pick_random().instantiate()
	add_child(car)
	car.global_position = positions.pick_random()


func on_next_level() -> void:
	can_spawn_cars = false


func on_game_reset() -> void:
	can_spawn_cars = false


func on_game_over() -> void:
	can_spawn_cars = false


func on_game_start() -> void:
	can_spawn_cars = true
