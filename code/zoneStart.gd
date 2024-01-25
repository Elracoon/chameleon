extends Area2D

@onready var instruSauter = $'../instruSauter'
@onready var instruDroite = $'../instruDroite'
@onready var instruGauche = $'../instruGauche'

# Called when the node enters the scene tree for the first time.
func _ready():
	instruSauter.visible = false
	instruDroite.visible = false
	instruGauche.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_body_entered(body):
	instruSauter.visible = true
	instruDroite.visible = true
	instruGauche.visible = true


func _on_body_exited(body):
	instruSauter.visible = false
	instruDroite.visible = false
	instruGauche.visible = false
