extends Node2D
class_name Ant

@onready var price: Node = $Price
@onready var behaviour: AntBehaviour = $Behaviour
@onready var speed: AntSpeed = $Speed
@onready var health: AntHealth = $Health
@onready var sprite_parent: Node2D = $SpriteParent

var type: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_type(type: int):
	self.type = type

func getSpeed():
	return speed.speed

func hit(damage: int):
	health.hit(damage)
	pass
	
func die():
	Ants.current.remove_child(self)
