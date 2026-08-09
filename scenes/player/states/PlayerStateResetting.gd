extends PlayerState

const BOUNDARY: float = 859.0
const MIN_DISTANCE: float = 5

var starting_pos := Vector2.ZERO

func setup() -> void:
	starting_pos = Vector2(BOUNDARY / 2, BOUNDARY / 2)
	player.global_position.x = starting_pos.x


func enter() -> void:
	print("Resetting")


func tick(delta: float) -> void:
	player.move_to(starting_pos, delta)
	
	if player.global_position.distance_to(starting_pos) < MIN_DISTANCE:
		EventBus.player_ready.emit()
		#state_machine.change_state(state_machine.get_state("Moving"))


func exit() -> void:
	pass
