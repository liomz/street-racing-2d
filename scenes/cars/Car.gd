class_name Car extends Area2D

const BOUNDARY_LIMIT: float = 894.0

var speed: float = 1.0


func _ready() -> void:
	EventBus.game_next_round.connect(on_next_round)


func init(_speed: float) -> void:
	speed = _speed


func _process(delta: float) -> void:
	move_car(delta)
	if global_position.y > BOUNDARY_LIMIT * 1.3:
		queue_free()


func move_car(delta: float) -> void:
	var y_pos := global_position.y
	y_pos += speed * delta * 100.0
	global_position.y = y_pos


func warp() -> void:
	if global_position.y > BOUNDARY_LIMIT * 1.3:
		global_position.y = -BOUNDARY_LIMIT * 1.3


func on_next_round() -> void:
	speed = speed * 10
