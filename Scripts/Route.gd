extends Node
class_name Route

static var current: Route
@onready var route: Route = $"."
@onready var spawner: Spawner = $Spawner
@onready var normal: Node = $Normal
@onready var shortcut: Node = $Shortcut
var waymarks: Array[Node2D]
var sh_waymarks: Array[Node2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current = self
	waymarks = []
	for child in normal.get_children():
		if child is Node2D:
			waymarks.append(child)
	
	sh_waymarks = []
	for child in shortcut.get_children():
		if child is Node2D:
			sh_waymarks.append(child)
	
	spawner.spawnNode = waymarks[0]
	spawner.ready()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
