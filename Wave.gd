extends Node2D

var route
var speed: int = 1200
var nextWaypointindex: int = 1
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var fade_to_black: Sprite2D = $FadeToBlack

var antArray :Array[Ant] = []

var active: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	active = false
	route = Route.current.waymarks.duplicate()
	route.reverse()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active:
		move(delta)
	pass

func move(delta):
	var direction = (route[nextWaypointindex].position - position).normalized()
	
	position += direction * speed * delta

	for ant : Ant in Ants.current.get_children():
		if position.distance_to(ant.position) < 100 and not antArray.has(ant):
			antArray.append(ant)
			ant.hit(5)

	# Check if we are close enough to the target to stop
	if position.distance_to(route[nextWaypointindex].position) < 5:
		position = route[nextWaypointindex].position  # Snap to the target position
		if nextWaypointindex+1 == len(route):
			goal()
		else:
			nextWaypointindex+=1

func activate():
	
	fade_to_black.show()
	await get_tree().create_timer(0.50).timeout
	fade_to_black.hide()
	antArray = []
	nextWaypointindex = 1
	active = true
	sprite_2d.show()
	position = route[0].global_position

func goal():
	active = false
	sprite_2d.hide()
	pass
