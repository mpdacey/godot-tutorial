extends CharacterBody2D

const SPEED = 110.0
const JUMP_VELOCITY = -270.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jumped = false

@onready var sprite = $AnimatedSprite2D
@onready var jump_sfx = $JumpSFX

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		jumped = false

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumped = true
		jump_sfx.play()

	# Gets input from -1 through to 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flips sprite
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true
	
	# Sprite animations
	sprite.speed_scale = 1
	if is_on_floor():
		if direction == 0:
			sprite.play("idle")
		else:
			sprite.play("run")
			sprite.speed_scale = clamp(abs(direction * 2),0.3, 1)
	else:
		if jumped:
			sprite.play("jump")
		else:
			sprite.play("fall")
	
	# Applies movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
