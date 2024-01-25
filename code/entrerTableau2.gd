extends Area2D

@onready var label2 = $'../Label2'

# Called when the node enters the scene tree for the first time.
func _ready():
	label2.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func detecEntrerlabel2(body):
	label2.visible = true


func detectSortiLabel2(body):
	label2.visible = false
