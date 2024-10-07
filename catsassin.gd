extends Node2D
@onready var cut: Sprite2D = $Cut
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var fade_to_black: Sprite2D = $FadeToBlack
@onready var eyes: Sprite2D = $Eyes

var active:bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func activate():
	var ants : Array[Ant]
	for ant: Ant in Ants.current.get_children():
		ants.append(ant)
	ants.sort_custom(sort_ants)

	fade_to_black.show()
	
	await get_tree().create_timer(0.20).timeout
	eyes.show()
	await get_tree().create_timer(0.30).timeout
	eyes.hide()

	var number: int = min(len(ants),3)
	
	for i:int in range(number):
		cut.show()
		cut.global_position = ants[i].global_position
		animation_player.current_animation = "Cut"
		animation_player.play()
		await get_tree().create_timer(0.20).timeout
		ants[i].hit(10)
		await get_tree().create_timer(0.30).timeout
		cut.hide()
		await get_tree().create_timer(0.10).timeout
	fade_to_black.hide()
func sort_ants(a: Ant, b: Ant):
	return b.type < a.type
