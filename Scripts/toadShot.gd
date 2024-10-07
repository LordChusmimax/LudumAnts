extends Node2D

var active :bool = false
var target: Ant
var speed: float = 1000
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

func shoot(ant: Ant):
	sprite_mask.global_position = mask_origin.global_position
	sprite_mask.global_rotation = mask_origin.global_rotation
	tongue.global_position = ant.global_position
	active = true
	target = ant
	tongue.show()
	fixedRotation=true
	ant.hit(2)
	await get_tree().create_timer(0.25).timeout
	active = false
	fixedRotation= false
	tongue.hide()
	
