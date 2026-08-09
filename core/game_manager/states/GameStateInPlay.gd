extends GameState


func setup() -> void:
	pass


func enter() -> void:
	EventBus.game_start.emit()


func tick(delta: float) -> void:
	pass


func exit() -> void:
	pass
