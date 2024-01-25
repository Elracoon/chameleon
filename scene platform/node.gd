extends Node2D

var respawn 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	respawn = $player.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func die():
	$player.position = respawn
