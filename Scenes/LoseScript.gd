extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	await get_tree().create_timer(4).timeout
	get_tree().change_scene_to_file("res://LudumAnts/Scenes/start.tscn")
	pass
