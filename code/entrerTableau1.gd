extends Area2D

var scene_to_load = "res://scene platform/node_2d.tscn"
var inZoneDect = false

@onready var label1 = $'../Label'

# Called when the node enters the scene tree for the first time.
func _ready():
	label1.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inZoneDect == true :
		entrerTableau()
	

func detecEntrerlabel1(body):
	label1.visible = true
	inZoneDect = true
	
	

func detectSortiLabel1(body):
	label1.visible = false
	inZoneDect = false
	
func entrerTableau():
	if Input.is_action_just_pressed("interagir"):
		# Chargez la nouvelle scène
		get_tree().change_scene_to_file(scene_to_load)
