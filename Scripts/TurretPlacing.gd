extends Node2D

@onready var blue_print: TileMapLayer = $".."
@onready var area_2d: Area2D = $Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D
const GREENISH = preload("res://LudumAnts/Greenish.tres")
const REDISH = preload("res://LudumAnts/Redish.tres")
@onready var menu_limit: Node2D = $"../MenuLimit"
var allowed:bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
	snap_to_tilemap()
	check_validity()
	change_shader()

# Function to snap the sprite to the nearest tile in the TileMap
func snap_to_tilemap() -> void:
	var tile_position = blue_print.local_to_map(global_position)
	var snapped_position = blue_print.map_to_local(tile_position)
	
	# Set the global position of the Sprite2D to the snapped position
	global_position = snapped_position

func check_validity():
	if global_position[0] > menu_limit.position[0]:	
		allowed = false
		return
	var overlapping_areas = area_2d.get_overlapping_areas()
	allowed = true
	for area in overlapping_areas:
		allowed = false
		return
	return

func change_shader():
	if allowed:
		sprite_2d.material=GREENISH
	else:
		sprite_2d.material=REDISH
