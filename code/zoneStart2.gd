extends Area2D

@onready var instruTire = $'../instruTire'

# Called when the node enters the scene tree for the first time.
func _ready():
	instruTire.visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_body_entered(body):
	instruTire.visible = true


func _on_body_exited(body):
	instruTire.visible = false
