extends Area2D

const  speed = 1000
var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_pressed("echap"):
		get_tree().quit()

func _physics_process(delta):
	velocity.x = speed * delta
	translate(velocity)
	$AnimatedSprite2D.play("shoot")

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
