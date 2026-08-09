extends GameState


func setup() -> void:
	pass


func enter() -> void:
	EventBus.game_over.emit()
	manager.output_label("Game Over")


func tick(delta: float) -> void:
	pass


func exit() -> void:
	pass
