extends Node2D

const BOUNDARY_LIMIT: float = 859.0
const DELAY_SPAWN_TIME: float = 2.0

@export var PositionNodes: Node2D
@export var CarScenes: Array[PackedScene]
@export var road_sprite: Sprite2D

var positions: Array[Vector2] = []

var delay_time: float = DELAY_SPAWN_TIME
var timer: float = 0.0

var can_spawn_cars: bool = false

var car_speed: float = 1.0
var road_speed: float = 1.0


func _ready() -> void:
	for marker in PositionNodes.get_children():
		positions.append(marker.global_position)
	
	EventBus.game_reset.connect(on_game_reset)
	EventBus.game_start.connect(on_game_start)
	EventBus.game_over.connect(on_game_over)
	EventBus.game_next_round.connect(on_game_next_round)


func _process(delta: float) -> void:
	timer += delta
	
	if timer > delay_time and can_spawn_cars:
		timer = 0
		spawn_random_car()


func spawn_random_car() -> void:
	var car = CarScenes.pick_random().instantiate()
	car.init(car_speed)
	add_child(car)
	car.global_position = positions.pick_random()


func on_game_reset() -> void:
	can_spawn_cars = false


func on_game_over() -> void:
	can_spawn_cars = false


func on_game_start() -> void:
	delay_time = clampf(DELAY_SPAWN_TIME - (GameManager.round * 0.5), 2, DELAY_SPAWN_TIME)
	can_spawn_cars = true


func on_game_next_round() -> void:
	can_spawn_cars = false
	var round: int = GameManager.round
	car_speed = round
	delay_time = clampf(DELAY_SPAWN_TIME - round * 0.3, 0.2, DELAY_SPAWN_TIME)
	
	road_sprite.material.set("shader_parameter/speed", 0.5 + round * 0.1)
