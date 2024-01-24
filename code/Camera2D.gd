extends Camera2D

@onready var player = $player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var vertical_offset = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = player.global_position.x
	position.y = player.global_position.y - vertical_offset
