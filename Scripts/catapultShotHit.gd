extends Sprite2D

const CANON_BALL_EXPLOSION = preload("res://LudumAnts/Sprites/Catapult/canon_ball_explosion.png")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hit(position: Vector2):
	show()
	global_position=position
	await get_tree().create_timer(0.50).timeout
	hide()
