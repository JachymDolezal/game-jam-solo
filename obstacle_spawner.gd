extends Node2D


const ObstacleNode = preload("res://obstacle_1.tscn")
const RedObstacleNode = preload("res://red_obstacle.tscn")
const x_lim_min = 0
const x_lim_max = 480
@onready var spawn_cooldown = $SpawnCooldown
@onready var window = get_parent().get_node("Window")
@onready var camera = window.get_node("Camera2D")

# list of spawnpoints coordinates at (0,128) (0,256) (0,384)
const spawnpoints = [128,256,384]
const object_types = {
	"obstacle": ObstacleNode}


func start_timer():
	spawn_cooldown.one_shot = true
	spawn_cooldown.wait_time = 6
	spawn_cooldown.start()

func spawn_obstacle():

	# print position of the camera
	print(camera.position)

	for x in spawnpoints:


		var rng = RandomNumberGenerator.new()
		var random_offset_y = rng.randi_range(-100,100)
		var random_offset_x = rng.randi_range(0,10)
		var obstacle_instance = null
		if (random_offset_x < 4):
			print("spawn deadly")
			obstacle_instance = RedObstacleNode.instantiate()
			add_child(obstacle_instance)
		else:
			obstacle_instance = ObstacleNode.instantiate()
			add_child(obstacle_instance)
		# get random offset
		obstacle_instance.global_position.y=camera.position.y - (50 + random_offset_y)
		obstacle_instance.global_position.x=x + random_offset_x
		print(obstacle_instance.position.x,obstacle_instance.position.y)

# Called when the node enters the scene tree for the first time.
func _ready():
	#start_timer()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.

func start_spawning():
	start_timer()

func _on_obstacle_contact():
	pass

func _process(delta):
	# get Camera2D (child of Window)
	#spawn_obstacle()
	#if fmod(delta,100):
		#print(spawn_cooldown.time_left)
	if spawn_cooldown.is_stopped():
		print("spawn obj")
		start_timer()
		spawn_obstacle()
	pass
