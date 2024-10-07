extends TextureButton
class_name SalamanderButton
@onready var turret_placer = $"../../../BluePrint/TurretPlacer"
@onready var abilities: Control = $"../../Abilities"
@onready var shop: Control = $".."
const Dragon_sprite = preload("res://LudumAnts/Sprites/Dragon/dragon_1.png")
@onready var button_audio: AudioStreamPlayer = $ButtonAudio

var cost: int = 20
var active: bool = false
@onready var money: Node = $"../../../GM/Money"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _pressed() -> void:
	button_audio.play()
	var was_active = active
	for button: TextureButton in shop.get_children():
		button.active = false
	for button: TextureButton in abilities.get_children():
		button.active = false
	if was_active or cost>money.money:
		active = false
		turret_placer.hide()
	else:
		active = true
		turret_placer.sprite_2d.texture = Dragon_sprite
		turret_placer.sprite_2d.position = Vector2(-10,115)
		turret_placer.show()

func _input(event):
	if active:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
				right_click_function()
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				left_click_function()

# Define the function you want to execute on right-click
func right_click_function():
	active = false
	turret_placer.hide()
	
func left_click_function():
	if turret_placer.allowed:
		money.money -= cost
		active = false
		turret_placer.hide()
		var dragon_scene = preload("res://LudumAnts/Scenes/Dragon.tscn")
		var dragon  = dragon_scene.instantiate()
		City.current.add_child(dragon)
		dragon.global_position = turret_placer.global_position
