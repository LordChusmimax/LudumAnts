extends Node
class_name Round

var number: int
var enemy_economy: int = 0
var tolerance: int = 0
var difficulty: int = 0
var possibilities : Array[int]= []
var spawncd :float = 0
var minspawncd :float = 0.3
var economygains: int = 1

var economycd :float = 0
var minseconomyncd :float = 1
@onready var gm: gm = $".."

var time:float = 0

var lottery: Array[int]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawncd+=delta
	economycd+= delta
	time += delta
	if time > 30:
		difficulty = 1
		minspawncd = 0.2
		economygains = 7
		
	if time > 120:
		difficulty = 2
		minspawncd = 0.1
		economygains = 20
		
	if time > 360:
		difficulty = 3
		minspawncd = 0.05
		economygains = 50
	
	if time > (60*7):
		gm.win()
	
	if economycd>=minseconomyncd:
		enemy_economy += economygains
		economycd=0
	pass
	
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
		
	if enemy_economy > AntEnum.AntPrice[AntEnum.AntType.Sir]:
		lottery.append(AntEnum.AntType.Base)
		lottery.append(AntEnum.AntType.Elite)
		lottery.append(AntEnum.AntType.Sir)
		lottery.append(AntEnum.AntType.Lady)
	
	if enemy_economy > AntEnum.AntPrice[AntEnum.AntType.Ambitious]:
		lottery.append(AntEnum.AntType.Base)
		lottery.append(AntEnum.AntType.Elite)
		lottery.append(AntEnum.AntType.Sir)
		lottery.append(AntEnum.AntType.Lady)
		lottery.append(AntEnum.AntType.Ambitious)
	
	if randi()%100 < tolerance:
		var lottery_ticket = randi()%len(lottery)
		Route.current.spawner.instantiate_ant(lottery[lottery_ticket])
		enemy_economy -= AntEnum.AntPrice[lottery[lottery_ticket]]
		tolerance -= 10
		return
	
	tolerance += 3
