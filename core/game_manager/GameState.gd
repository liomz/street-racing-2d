@abstract class_name GameState extends State

var manager: GameManager

func _init_state(_state_machine: StateMachine) -> void:
	state_machine = _state_machine
	manager = _state_machine.manager
	setup()
