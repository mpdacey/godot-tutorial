extends Node2D

const SPEED = 60
var direction = 1
@onready var raycast_right = $RaycastRight
@onready var raycast_left = $RaycastLeft
@onready var raycast_right_floor = $RaycastRightFloor
@onready var raycast_left_floor = $RaycastLeftFloor
@onready var sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(raycast_right.is_colliding() || !raycast_right_floor.is_colliding()):
		flip_direction(true)
	elif(raycast_left.is_colliding() || !raycast_left_floor.is_colliding()):
		flip_direction(false)
	
	
	position.x += SPEED * delta * direction

func flip_direction(goingRight):
	if(goingRight):
		direction = -1
		sprite.flip_h = true
	else:
		direction = 1
		sprite.flip_h = false
