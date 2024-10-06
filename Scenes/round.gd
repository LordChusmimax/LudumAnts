extends Node
class_name Round

var number: int
var enemy_economy: int = 0
var tolerance: int = 0
var possibilities : Array[int]= []
var spawncd :float = 0
var minspawncd :float = 0.2

var lottery: Array[int]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawncd+=delta
	if spawncd>=minspawncd:
		manage_economy()
		spawncd=0
	pass
	
func manage_economy():
	lottery = []
	
	if enemy_economy < AntEnum.AntPrice[AntEnum.AntType.Base]:
		return
	
	lottery.append(AntEnum.AntType.Base)
	
	if enemy_economy > AntEnum.AntPrice[AntEnum.AntType.Elite]:
		lottery.append(AntEnum.AntType.Base)
		lottery.append(AntEnum.AntType.Base)
		lottery.append(AntEnum.AntType.Elite)
	
	if randi()%100 < tolerance:
		var lottery_ticket = randi()%len(lottery)
		Route.current.spawner.instantiate_ant(lottery[lottery_ticket])
		enemy_economy -= AntEnum.AntPrice[lottery[lottery_ticket]]
		tolerance -= 10
		return
	
	tolerance += 3
