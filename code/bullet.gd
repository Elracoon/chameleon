extends Area2D

const  speed = 1000
var velocity = Vector2()
var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func set_bullet_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite2D.flip_h = true

func _process(delta):
	if Input.is_action_pressed("echap"):
		get_tree().quit()

func _physics_process(delta):
	velocity.x = speed * delta * direction
	translate(velocity)
	$AnimatedSprite2D.play("shoot")

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()



func _on_area_entered(area):
	print(area)
	if area.name == "HitBox":
		print("touché")
		area.get_parent().die()
