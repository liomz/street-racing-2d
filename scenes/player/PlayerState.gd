@abstract class_name PlayerState extends State

var player: Player = null

func _init_state(_state_machine: StateMachine) -> void:
	state_machine = _state_machine
	player = _state_machine.player
	setup()
