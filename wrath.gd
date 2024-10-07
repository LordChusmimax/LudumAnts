extends Node2D
class_name Wrath
@onready var shadow: Sprite2D = $Shadow
@onready var hit: Sprite2D = $Hit
@onready var menu_limit: Node2D = $"../../BluePrint/MenuLimit"
@onready var sprite_2d: Sprite2D = $Shadow/Sprite2D
@onready var wrathButton: WrathButton = $"../../UI/Abilities/Wrath"

var range: int = 150

const GREENISH = preload("res://LudumAnts/Greenish.tres")
const REDISH = preload("res://LudumAnts/Redish.tres")

var active: bool
var allowed: bool
var hitting: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	active = false
	allowed = true
	hitting = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active:
		follow()
	if global_position[0]<menu_limit.position[0]:
		allowed = true
		sprite_2d.hide()
	else:
		allowed = false 
		sprite_2d.show()
	pass

func follow():
	if active and not hitting:
		global_position = get_global_mouse_position()

func _input(event):
	if active:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
				right_click_function()
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				left_click_function()

func activate(value:bool):
	if value:
		shadow.show()
	else:
		shadow.hide()
	active = value

# Define the function you want to execute on right-click
func right_click_function():
	active = false
	shadow.hide()
	
func left_click_function():
	if allowed:
		hitting = true
		active = false
		wrathButton.active = false
		shadow.hide()
		hit.show()
		await get_tree().create_timer(0.25).timeout
		hitting = false
		hit.hide()
		wrathButton.loyalty.loyalty -= wrathButton.cost
		for ant: Ant in Ants.current.get_children():
			if ant.global_position.distance_to(global_position) < range:
				ant.hit(5)
