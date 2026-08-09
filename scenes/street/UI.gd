extends CanvasLayer

@onready var label: Label = $Control/Label



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.label = label
