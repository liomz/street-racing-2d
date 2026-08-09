extends GameState


var timer: float = 0.0

func setup() -> void:
	pass


func enter() -> void:
	print("Reset")
	EventBus.game_reset.emit()
	timer = 0
	EventBus.player_ready.connect(on_player_ready)
	manager.output_label("Round %d" % (manager.round))


func tick(_delta: float) -> void:
	pass


func exit() -> void:
	EventBus.player_ready.disconnect(on_player_ready)

func on_player_ready() -> void:
	state_machine.change_state(state_machine.get_state("NextRound"))
