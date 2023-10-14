extends CharacterBody2D

@onready var dash = $Dash

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const dash_duration = 0.2
const dash_cooldown = 2
const dash_speed = 600

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_dashing = false
var dash_ready = true
var actual_speed = SPEED
var input_direction = Input.get_vector("Arrow_left", "Arrow_right", "Arrow_up", "Arrow_down")


# Handles the dash
func cast_dash():
	print("dash")
	
# handles the spell casting
func cast_spell():
	print("casting a spell")
	
func check_if_stick():
	pass

func _ready():
	var actual_speed = SPEED

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Handle Dash
	if Input.is_action_just_pressed("Dash"):
		print(dash.dash_cooldown.time_left)
		if dash.is_dash_ready():
			print("prep for dash")
			dash.start_dash(dash_duration)
			cast_dash()
			input_direction = Input.get_vector("Arrow_left", "Arrow_right", "Arrow_up", "Arrow_down")
			dash.start_cooldown(dash_cooldown)

	# modify speed based on dash
	#actual_speed = dash_speed if dash.is_dashing() else SPEED
		
	# Handle Ability
	if Input.is_action_just_pressed("Ability"):
		cast_spell()
	
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	
	if dash.is_dashing():
		if input_direction == Vector2(0, -1):
			print("dash up")
			velocity = input_direction * 400
			velocity.normalized()
		else:
			velocity = input_direction * dash_speed
			velocity.normalized()
	else:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
