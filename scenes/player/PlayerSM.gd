extends StateMachine

@export var player: Player
@export var car_detect: Area2D

func tick(delta: float) -> void:
	state.tick(delta)
