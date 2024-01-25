extends Node

@onready var label3 = $'../Label3'

# Called when the node enters the scene tree for the first time.
func _ready():
	label3.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func detectEntrerlabel3(body):
	label3.visible = true
	
	

func detectSortiLabel3(body):
	label3.visible = false
