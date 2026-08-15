extends GameState


func setup() -> void:
	pass


func enter() -> void:
	EventBus.game_start.emit()
	EventBus.car_collided.connect(on_collision)


func tick(delta: float) -> void:
	
	manager.time_left -= delta
	
	manager.output_label("%.1f" % manager.time_left)
	
	if manager.time_left <= 0:
		manager.time_left = 0
		state_machine.change_state(state_machine.get_state("NextRound"))


func exit() -> void:
	EventBus.car_collided.disconnect(on_collision)


func on_collision() -> void:
	state_machine.change_state(state_machine.get_state("GameOver"))
