extends Node
class_name AntBehaviour

var route: Array[Node2D]
var nextWaypointindex: int
@onready var ant: Ant = $".."
@onready var sprite_parent: Node2D = $"../SpriteParent"

var direction: Vector2 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move(delta)
	handleSprite()

func move(delta: float):
	direction = (route[nextWaypointindex].position - ant.position).normalized()

	# Update the position by moving towards the target
	ant.position += direction * ant.getSpeed() * delta

	# Check if we are close enough to the target to stop
	if ant.position.distance_to(route[nextWaypointindex].position) < 5:
		ant.position = route[nextWaypointindex].position  # Snap to the target position
		if nextWaypointindex+1 == len(route):
			nextWaypointindex=0
		elif nextWaypointindex==0 :
			goal()
		else:
			nextWaypointindex+=1

func handleSprite():
	sprite_parent.handleSprite(direction.angle())

func goal():
	nextWaypointindex=0
	Ants.current.remove_child(ant)

func spawn():
	sprite_parent.setType(ant.type)
	ant.position = Route.current.waymarks[0].position
	route = Route.current.waymarks
	nextWaypointindex = 1
	pass
