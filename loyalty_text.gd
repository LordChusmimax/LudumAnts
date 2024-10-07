extends RichTextLabel
@onready var loyalty: Node = $"../../GM/Loyalty"
@onready var texture_progress_bar: TextureProgressBar = $"../../OtherUi/LoyaltyBar/TextureProgressBar"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(loyalty.loyalty)
	texture_progress_bar.value = loyalty.loyalty
