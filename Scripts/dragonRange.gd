extends Node2D
class_name DragonRange
var range: float
var cd :float
var maxcd : float = 1
@onready var tower: Node2D = $".."
@onready var sprite_parent: Node2D = $"../SpriteParent"

@onready var shot: Sprite2D = $"../Shot"
@onready var dragon_anim: AnimationPlayer = $"../DragonAnimation"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	range = 1000
	dragon_anim.animation_set_next("Fire","Idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	manage_cd(delta)
	attack()
	pass

func attack():
	for ant: Ant in Ants.current.get_children():
		if tower.position.distance_to(ant.position) <= range:
			var direction = (ant.position - tower.position).normalized()
			sprite_parent.rotation= direction.angle() - PI/2
			if cd>=maxcd:
				shoot(ant)
				cd = 0
		#Ants.current.remove_child(ant)
			return

func shoot(ant: Ant):
	dragon_anim.current_animation = "Fire"
	await get_tree().create_timer(0.25).timeout
	if tower.position.distance_to(ant.position) <= range:
		shot.shoot(ant)
		return
	if tower.position.distance_to(ant.position) >range:
		for ant2: Ant in Ants.current.get_children():
			if tower.position.distance_to(ant2.position) <= range:
				var direction = (ant2.position - tower.position).normalized()
				shoot(ant2)

func manage_cd(delta: float):
	if cd<maxcd:
		cd+=delta
