extends GameState

const NEXT_ROUND_DURATION: float = 3.0

var timer: float = 0.0

func setup() -> void:
	pass


func enter() -> void:
	timer = 0
	manager.round += 1
	manager.time_left = manager.ROUND_DURATION * manager.round


func tick(delta: float) -> void:
	timer += delta
	
	manager.output_label("%d" % int(NEXT_ROUND_DURATION - timer))
	
	if timer > NEXT_ROUND_DURATION:
		state_machine.change_state(state_machine.get_state("InPlay"))


func exit() -> void:
	pass
