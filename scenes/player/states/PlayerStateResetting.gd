extends PlayerState

const BOUNDARY: float = 859.0
const MIN_DISTANCE: float = 1

var starting_pos := Vector2.ZERO

func setup() -> void:
	starting_pos = Vector2(BOUNDARY / 2, BOUNDARY / 2)


func enter() -> void:
	pass


func tick(delta: float) -> void:
	player.move_to(starting_pos, delta)
	
	if player.global_position.distance_to(starting_pos) < MIN_DISTANCE:
		state_machine.change_state(state_machine.get_state("Moving"))


func exit() -> void:
	pass
