extends StateMachine


@export var manager: Node


func tick(delta: float) -> void:
	state.tick(delta)
