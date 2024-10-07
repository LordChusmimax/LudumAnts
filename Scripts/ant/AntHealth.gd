extends Node
class_name AntHealth
var hp: int
@onready var ant: Ant = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setHealth()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hit(damage: int):
	hp -= damage
	if hp <= 0 :
		die()

func die():
	ant.die()

func setHealth():
	hp = AntEnum.AntHealth[ant.type]
