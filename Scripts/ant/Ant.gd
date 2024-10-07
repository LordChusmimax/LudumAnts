extends Node2D
class_name Ant

@onready var price: Node = $Price
@onready var behaviour: AntBehaviour = $Behaviour
@onready var speed: AntSpeed = $Speed
@onready var health: AntHealth = $Health
@onready var sprite_parent: Node2D = $SpriteParent
const ANT_DEATH = preload("res://LudumAnts/Scenes/ant_death.tscn")
@onready var steps_audio: AudioStreamPlayer = $StepsAudio
var type: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	steps_audio.play()
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
	var ant_corpse = ANT_DEATH.instantiate()
	Graveyard.current.add_child(ant_corpse)
	ant_corpse.global_position = global_position
	gm.current.money.money += AntEnum.AntLoot[type]
	Ants.current.remove_child(self)
