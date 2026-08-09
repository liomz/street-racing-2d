extends StateMachine

@export var player: Player

func tick(delta: float) -> void:
	state.tick(delta)
