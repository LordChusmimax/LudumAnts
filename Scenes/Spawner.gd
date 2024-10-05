extends Node
class_name Spawner
@onready var route: Route = $".."

var active:bool = false

var spawnNode :Node2D
# Called when the node enters the scene tree for the first time.
func ready() -> void:
	var ant_scene = load("res://LudumAnts/Scenes/ant.tscn")
	var ant: Ant = ant_scene.instantiate()
	Ants.current.add_child(ant)
	active = true

func _process(delta: float) -> void:
	if active and (randi()%100)>98:
		var ant_scene = load("res://LudumAnts/Scenes/ant.tscn")
		var ant: Ant = ant_scene.instantiate()
		Ants.current.add_child(ant)
	pass
