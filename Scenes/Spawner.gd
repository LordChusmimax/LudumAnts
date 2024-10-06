extends Node
class_name Spawner
@onready var route: Route = $".."

var active:bool = false

var spawnNode :Node2D
# Called when the node enters the scene tree for the first time.
func ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass

func instantiate_ant(antType: int):
	var ant_scene = load("res://LudumAnts/Scenes/ant.tscn")
	var ant: Ant = ant_scene.instantiate()
	ant.set_type(antType)
	Ants.current.add_child(ant)
