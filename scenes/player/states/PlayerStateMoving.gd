extends PlayerState

func setup() -> void:
	pass


func enter() -> void:
	pass


func tick(delta: float) -> void:
	player.add_drag_force(delta)
	player.handle_movement(delta)
	player.clamp_to_boundaries()


func exit() -> void:
	pass
