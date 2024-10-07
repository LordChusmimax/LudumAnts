extends Node2D

var active :bool = false
var target: Ant
@onready var mask_origin: Node2D = $"../SpriteParent/MaskOrigin"
@onready var shot_hit: Sprite2D = $"../ShotHit"
@onready var tongue: Node2D = $SpriteMask/TonguePoint
@onready var toad: Node2D = $".."
var fixedRotation :bool = false
@onready var sprite_mask: Sprite2D = $SpriteMask

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func shoot(range: float):
	for ant: Ant in Ants.current.get_children():
		if global_position.distance_to(ant.global_position) <= range:
			ant.hit(1)
	pass
	
