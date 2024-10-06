extends Object
class_name AntEnum
# Called when the node enters the scene tree for the first time.
enum AntType {
	Base,
	Elite
}

enum AntDirection {
	Up,
	Down,
	Left,
	Right
}

static var AntPrice = {
	AntType.Base : 1,
	AntType.Elite : 3
}

static var AntHealth = {
	AntType.Base : 3,
	AntType.Elite : 7
}

static var AntSpeed = {
	AntType.Base : 300,
	AntType.Elite : 150
}

static var BaseSprites = {
	AntDirection.Up : preload("res://LudumAnts/Sprites/Ants/pillager_up.png"),
	AntDirection.Down: preload("res://LudumAnts/Sprites/Ants/pillager_down.png"),
	AntDirection.Left : preload("res://LudumAnts/Sprites/Ants/pillager_left.png"),
	AntDirection.Right : preload("res://LudumAnts/Sprites/Ants/pillager_right.png")
}

static var EliteSprites = {
	AntDirection.Up : preload("res://LudumAnts/Sprites/Ants/great_pillager_up.png"),
	AntDirection.Down: preload("res://LudumAnts/Sprites/Ants/great_pillager_down.png"),
	AntDirection.Left : preload("res://LudumAnts/Sprites/Ants/great_pillager_left.png"),
	AntDirection.Right : preload("res://LudumAnts/Sprites/Ants/great_pillager_right.png")
}

static var AntSprites = {
	AntType.Base : BaseSprites,
	AntType.Elite : EliteSprites
}
