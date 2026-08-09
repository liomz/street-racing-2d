extends Node

@onready var game_sm: StateMachine = $GameSM


func _ready() -> void:
	game_sm.init()
	game_sm.activate()


func _process(delta: float) -> void:
	game_sm.tick(delta)
