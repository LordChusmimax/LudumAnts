extends Node2D
class_name LionRange
var range: float
var cd :float
var maxcd : float = 2
@onready var tower: Node2D = $".."
@onready var sprite_parent: Node2D = $"../SpriteParent"

@onready var shot: Node2D = $"../Shot"
@onready var toad_anim: AnimationPlayer = $"../LionAnimation"
@onready var audio_spawn: AudioStreamPlayer = $"../AudioSpawn"
@onready var audio_attack: AudioStreamPlayer = $"../AudioAttack"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_spawn.play()
	range = 500
	toad_anim.animation_set_next("Attack","Idle")
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
			if not shot.fixedRotation:
				sprite_parent.rotation= direction.angle() - PI/2
			if cd>=maxcd:
				shoot(ant, range)
				cd = 0
		#Ants.current.remove_child(ant)
			return

func shoot(ant: Ant, range: int):
	
	toad_anim.current_animation = "Attack"

	await get_tree().create_timer(1).timeout
	audio_attack.play()
	shot.shoot(range)
	return

func manage_cd(delta: float):
	if cd<maxcd:
		cd+=delta
