extends TextureButton
class_name SalamanderButton
@onready var salamander_positioner: Node2D = $"../../../BluePrint/SalamanderPositioner"
@onready var shop: Control = $".."

var cost: int = 15
var active: bool = false
@onready var money: Node = $"../../../GM/Money"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _pressed() -> void:
	var was_active = active
	for button: TextureButton in shop.get_children():
		button.active = false
	if was_active or cost>money.money:
		active = false
		salamander_positioner.hide()
	else:
		active = true
		salamander_positioner.show()

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
	salamander_positioner.hide()
	
func left_click_function():
	if salamander_positioner.allowed:
		money.money -= cost
		active = false
		salamander_positioner.hide()
		var dragon_scene = preload("res://LudumAnts/Scenes/Dragon.tscn")
		var dragon  = dragon_scene.instantiate()
		City.current.add_child(dragon)
		dragon.global_position = salamander_positioner.global_position
