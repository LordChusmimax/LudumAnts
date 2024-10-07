extends Node
class_name gm
@onready var round: Round = $Round
@onready var money: Node = $Money
@onready var hp: Node = $HP

static var current: gm
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current = self
	round.tolerance = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func win():
	get_tree().change_scene_to_file("res://LudumAnts/Scenes/win.tscn")
	pass
	
func lose():
	get_tree().change_scene_to_file("res://LudumAnts/Scenes/lose.tscn")
	pass
