class_name Player extends CharacterBody2D

const BOUNDARY_LIMIT: float = 894.0
const CAR_WIDTH: float = 46.0
const CAR_LENGTH: float = 112.0

const DRAG_FORCE: float = 5.0

var speed: float = 20.0


@onready var car_detect: Area2D = $CarDetect
@onready var player_sm: StateMachine = $PlayerSM


func _ready() -> void:
	
	player_sm.init()
	player_sm.activate()
	EventBus.game_start.connect(on_game_start)
	EventBus.game_reset.connect(on_game_reset)
	EventBus.game_over.connect(on_game_over)


func _process(delta: float) -> void:
	player_sm.tick(delta)
	tilt_car()
	move_and_slide()


func move_to(pos: Vector2, delta: float) -> void:
	var dir := global_position.direction_to(pos)
	velocity = dir * speed * delta * 1000.0


func handle_movement(delta: float) -> void:
	var input_vector := Input.get_vector("left", "right", "up", "down")
	velocity = input_vector * speed * delta * 1000.0


func tilt_car() -> void:
	var tilt_angle := 0.0
	
	if velocity.x > 0:
		tilt_angle = 15
	elif velocity.x < 0:
		tilt_angle = -15
	else:
		tilt_angle = 0
	
	rotation_degrees = lerp(rotation_degrees, tilt_angle, 0.1)


func clamp_to_boundaries() -> void:
	
	if global_position.x - CAR_WIDTH < 0:
		global_position.x = CAR_WIDTH
	
	if global_position.x + CAR_WIDTH > BOUNDARY_LIMIT:
		global_position.x = BOUNDARY_LIMIT - CAR_WIDTH
	
	if global_position.y - CAR_LENGTH < 0:
		global_position.y = CAR_LENGTH
	
	if global_position.y + CAR_LENGTH > BOUNDARY_LIMIT:
		global_position.y = BOUNDARY_LIMIT - CAR_LENGTH


func add_drag_force(delta: float) -> void:
	
	velocity.y += DRAG_FORCE * delta * 1000.0
	
	if velocity.x != 0:
		velocity.y += DRAG_FORCE * delta * 1000.0


func on_game_over() -> void:
	player_sm.change_state(player_sm.get_state("Crashing"))


func on_game_start() -> void:
	player_sm.change_state(player_sm.get_state("Moving"))


func on_game_reset() -> void:
	player_sm.change_state(player_sm.get_state("Resetting"))
