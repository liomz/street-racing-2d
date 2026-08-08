class_name Player extends CharacterBody2D

var speed: float = 200.0


func _process(delta: float) -> void:
	handle_movement(delta)
	tilt_car()
	move_and_slide()


func handle_movement(delta: float) -> void:
	var input_vector := Input.get_vector("left", "right", "up", "down")
	velocity = input_vector * speed * delta * 100.0


func tilt_car() -> void:
	var tilt_angle := 0.0
	
	if velocity.x > 0:
		tilt_angle = 15
	elif velocity.x < 0:
		tilt_angle = -15
	else:
		tilt_angle = 0
	
	rotation_degrees = lerp(rotation_degrees, tilt_angle, 0.1)
