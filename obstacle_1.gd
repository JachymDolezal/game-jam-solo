extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -10

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 5


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()
