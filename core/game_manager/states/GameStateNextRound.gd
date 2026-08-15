extends GameState

const NEXT_ROUND_DURATION: float = 5.0

var timer: float = 0.0

func setup() -> void:
	pass


func enter() -> void:
	timer = NEXT_ROUND_DURATION
	manager.round += 1
	manager.time_left = manager.ROUND_DURATION
	EventBus.game_next_round.emit()


func tick(delta: float) -> void:
	timer -= delta
	
	if timer <= 3:
		manager.output_label("%d" % int(timer + 1))
	else:
		manager.output_label("Round " + str(manager.round))
	
	if timer <= 0.0:
		state_machine.change_state(state_machine.get_state("InPlay"))


func exit() -> void:
	pass
