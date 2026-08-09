@abstract class_name State extends Node

var state_machine: StateMachine


@abstract func setup() -> void
@abstract func enter() -> void
@abstract func tick(delta: float) -> void
@abstract func exit() -> void



func _init_state(_state_machine: StateMachine) -> void:
	state_machine = _state_machine
	setup()
