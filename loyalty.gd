extends Node

var maxLoyalty : int = 100
var loyalty: int = 30
var counter : float = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	counter += delta
	if counter >= 1:
		counter -= 1
		loyalty += 1
	if loyalty > maxLoyalty:
		loyalty = maxLoyalty
	pass
