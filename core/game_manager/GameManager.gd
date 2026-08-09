extends Node

@onready var game_sm: StateMachine = $GameSM

const ROUND_DURATION: float = 15.0

var label: Label = null

var round: int = 0
var time_left: float = ROUND_DURATION

func _ready() -> void:
	game_sm.init()
	game_sm.activate()


func _process(delta: float) -> void:
	game_sm.tick(delta)


func output_label(text: String) -> void:
	if label: label.text = text
