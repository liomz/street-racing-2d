extends GameState


func setup() -> void:
	pass


func enter() -> void:
	EventBus.game_reset.emit()


func tick(delta: float) -> void:
	pass


func exit() -> void:
	pass
