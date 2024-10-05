extends Node
class_name Route

static var current: Route
@onready var route: Route = $"."
@onready var spawner: Spawner = $Spawner
var waymarks: Array[Node2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current = self
	waymarks = []
	for child in get_children():
		if child is Node2D:
			waymarks.append(child)
	pass # Replace with function body.
	spawner.spawnNode = waymarks[0]
	spawner.ready()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
