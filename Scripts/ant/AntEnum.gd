extends Object
class_name AntEnum
# Called when the node enters the scene tree for the first time.
enum AntType {
	Base,
	Elite,
	Sir,
	Lady,
	Ambitious
}

enum AntDirection {
	Up,
	Down,
	Left,
	Right
}

static var AntPrice = {
	AntType.Base : 1,
	AntType.Elite : 3,
	AntType.Sir : 5,
	AntType.Lady : 5,
	AntType.Ambitious : 10
}

static var AntLoot = {
	AntType.Base : 1,
	AntType.Elite : 3,
	AntType.Sir : 5,
	AntType.Lady : 5,
	AntType.Ambitious : 10
}

static var AntHit = {
	AntType.Base : 5,
	AntType.Elite : 10,
	AntType.Sir : 25,
	AntType.Lady : 25,
	AntType.Ambitious : 40
}

static var AntHealth = {
	AntType.Base : 3,
	AntType.Elite : 10,
	AntType.Sir : 7,
	AntType.Lady : 4,
	AntType.Ambitious : 15
}

static var AntSpeed = {
	AntType.Base : 300,
	AntType.Elite : 225,
	AntType.Sir : 300,
	AntType.Lady : 400,
	AntType.Ambitious : 300
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

static var SirSprites = {
	AntDirection.Up : preload("res://LudumAnts/Sprites/Ants/sir_pillager_up.png"),
	AntDirection.Down: preload("res://LudumAnts/Sprites/Ants/sir_pillager_down.png"),
	AntDirection.Left : preload("res://LudumAnts/Sprites/Ants/sir_pillager_left.png"),
	AntDirection.Right : preload("res://LudumAnts/Sprites/Ants/sir_pillager_right.png")
}

static var LadySprites = {
	AntDirection.Up : preload("res://LudumAnts/Sprites/Ants/lady_pillager_up.png"),
	AntDirection.Down: preload("res://LudumAnts/Sprites/Ants/lady_pillager_down.png"),
	AntDirection.Left : preload("res://LudumAnts/Sprites/Ants/lady_pillager_left.png"),
	AntDirection.Right : preload("res://LudumAnts/Sprites/Ants/lady_pillager_right.png")
}

static var AmbitiousSprites = {
	AntDirection.Up : preload("res://LudumAnts/Sprites/Ants/ambitious_pillager_up.png"),
	AntDirection.Down: preload("res://LudumAnts/Sprites/Ants/ambitious_pillager_down.png"),
	AntDirection.Left : preload("res://LudumAnts/Sprites/Ants/ambitious_pillager_left.png"),
	AntDirection.Right : preload("res://LudumAnts/Sprites/Ants/ambitious_pillager_right.png")
}

static var AntSprites = {
	AntType.Base : BaseSprites,
	AntType.Elite : EliteSprites,
	AntType.Sir : SirSprites,
	AntType.Lady : LadySprites,
	AntType.Ambitious : AmbitiousSprites
}
