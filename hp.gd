extends Node
var hp: int
var maxhp: int
@onready var texture_progress_bar: TextureProgressBar = $"../../OtherUi/HealthBar/TextureProgressBar"
@onready var gm: gm = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	maxhp = 100
	hp = maxhp
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hit(value: int):
	hp -= value
	texture_progress_bar.value = hp
	
	if hp <= 0:
		lose()
		
func lose():
	gm.lose()
	pass
