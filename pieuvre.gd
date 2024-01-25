extends CharacterBody2D

var SPEED = -60.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var facing_right = false

func _ready():
	$HitBox.connect("body_entered", _on_hit_box_area_entered)


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if !$RayCast2D.is_colliding() && is_on_floor():
		flip()

	velocity.x = SPEED
	move_and_slide()

func flip():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
	if facing_right:
		SPEED = abs(SPEED)
	else:
		SPEED = abs(SPEED) * -1

func _on_hit_box_area_entered(area):
	if area.get_parent().name == "player":
		area.get_parent().die()
