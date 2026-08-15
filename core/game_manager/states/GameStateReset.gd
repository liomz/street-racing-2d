extends GameState

func setup() -> void:
	pass


func enter() -> void:
	EventBus.game_reset.emit()
	EventBus.player_ready.connect(on_player_ready)


func tick(_delta: float) -> void:
	pass


func exit() -> void:
	EventBus.player_ready.disconnect(on_player_ready)

func on_player_ready() -> void:
	state_machine.change_state(state_machine.get_state("InPlay"))
