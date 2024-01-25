extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -700.0

const BULLET = preload("res://scene platform/bullet.tscn")


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("echap"):
		get_tree().quit()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AudioStreamPlayer2D2.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play('walk')
		if Input.is_action_pressed("move_right"):
				$AnimatedSprite2D.flip_h = false
				if sign($Marker2D.position.x) == -1:
					$Marker2D.position.x *= -1
		if Input.is_action_pressed("move_left"):
				$AnimatedSprite2D.flip_h = true
				if sign($Marker2D.position.x) == 1:
					$Marker2D.position.x *= -1
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.stop()
		
	if Input.is_action_just_pressed("fire_bullet"):
		var bullet = BULLET.instantiate()
		if sign($Marker2D.position.x) == 1:
			bullet.set_bullet_direction(1)
		else:
			bullet.set_bullet_direction(-1)
		get_parent().add_child(bullet)
		bullet.position = $Marker2D.global_position

	move_and_slide()
	
