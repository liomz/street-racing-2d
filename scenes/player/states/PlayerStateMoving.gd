extends PlayerState

func setup() -> void:
	pass


func enter() -> void:
	car_detect.area_entered.connect(on_collision)


func tick(delta: float) -> void:
	player.handle_movement(delta)
	player.add_drag_force(delta)
	player.clamp_to_boundaries()


func exit() -> void:
	car_detect.area_entered.disconnect(on_collision)


func on_collision(_area: Area2D) -> void:
	EventBus.car_collided.emit()
