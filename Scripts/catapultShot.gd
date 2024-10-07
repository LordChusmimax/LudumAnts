extends Sprite2D

var active :bool = false
var target: Ant
var speed: float = 1000
@onready var fire_origin: Node2D = $"../SpriteParent/FireOrigin"
@onready var shot_hit: Sprite2D = $"../ShotHit"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active:
		move(delta)
	pass

func shoot(ant: Ant):
	global_position = fire_origin.global_position
	active = true
	target = ant
	show()

func move(delta: float):
	if global_position.distance_to(target.position) < 30:
		hit()
		return
	var direction = (target.position - global_position).normalized()

	# Update the position by moving towards the target
	global_position += direction * speed * delta
	rotation= direction.angle()

func hit():
	for ant : Ant in Ants.current.get_children():
		if global_position.distance_to(ant.global_position) < 150:
			ant.hit(3)
	active = false
	hide()
	shot_hit.hit(global_position)
