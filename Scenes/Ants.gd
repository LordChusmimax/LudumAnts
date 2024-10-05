extends Node
class_name Ants

static var current: Ants
@onready var ants: Ants = $"."



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if current == null:
		current = ants


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
