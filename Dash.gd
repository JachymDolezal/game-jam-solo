extends Node2D

@onready var duration_timer = $DurationTimer
@onready var dash_cooldown = $DashCooldown

func start_dash(duration):
	dash_cooldown.one_shot = true
	duration_timer.wait_time = duration
	duration_timer.start()


func is_dashing():
	return !duration_timer.is_stopped()

func start_cooldown(duration):
	dash_cooldown.one_shot = true
	dash_cooldown.wait_time = duration
	dash_cooldown.start()

func is_dash_ready():
	return dash_cooldown.is_stopped()

#func _process(delta):
	#print("duartion timer",duration_timer.time_left,"cooldown",dash_cooldown.time_left)
