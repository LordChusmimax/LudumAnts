extends TextureButton
class_name WaveButton
@onready var wave: Node2D = $"../../../Abilities/Wave"

@onready var turret_placer: Node2D = $"../../../BluePrint/TurretPlacer"
@onready var loyalty: Node = $"../../../GM/Loyalty"

@onready var shop: Control = $"../../Shop"
@onready var abilities: Control = $".."

var cost: int = 50
var active: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _pressed() -> void:
	var was_active = active
	turret_placer.hide()
	for button: TextureButton in shop.get_children():
		button.active = false
	for button: TextureButton in abilities.get_children():
		button.active = false
	if cost<loyalty.loyalty and !wave.active:
		wave.activate()
		loyalty.loyalty -= cost
