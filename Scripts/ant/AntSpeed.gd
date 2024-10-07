extends Node
class_name AntSpeed
var speed: float
@onready var ant: Ant = $".."


func _ready() -> void:
	setSpeed()
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func setSpeed():
	speed = AntEnum.AntSpeed[ant.type]
