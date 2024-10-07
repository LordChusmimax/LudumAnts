extends Node2D

var sprites: Dictionary
var currentDirection: int

@onready var ant: Ant = $".."
@onready var sprite_2d: Sprite2D = $Sprite2D

var wobble_amplitude = 0.1
var wobble_speed = 10.0
var time_passed = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	wobble_sprite(delta)
	pass

func setType(type :int):
	sprites = AntEnum.AntSprites[type]
	
func handleSprite(angle :float):
	checkDirection(angle)

func checkDirection(angle):
	if angle<-3*PI/4 or angle>3*PI/4 :
		sprite_2d.texture = sprites[AntEnum.AntDirection.Left]
	elif angle-3*PI/4 and angle <= -PI/4:
		sprite_2d.texture = sprites[AntEnum.AntDirection.Up]
	elif angle<3*PI/4 and angle>= PI/4:
		sprite_2d.texture = sprites[AntEnum.AntDirection.Down]
	else:
		sprite_2d.texture = sprites[AntEnum.AntDirection.Right]
		
func wobble_sprite(delta: float) -> void:
	time_passed += delta * wobble_speed
	var wobble = sin(time_passed) * wobble_amplitude
	
	# Apply the wobble to the sprite's rotation
	sprite_2d.rotation = wobble
