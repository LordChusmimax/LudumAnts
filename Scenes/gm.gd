extends Node
class_name gm
@onready var round: Round = $Round

static var current: gm
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current = self
	round.enemy_economy = 15
	round.tolerance = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
