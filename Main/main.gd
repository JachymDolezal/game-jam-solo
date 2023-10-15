extends Node2D
@onready var audio = $AudioStreamPlayer
var Sound = preload("res://Assets/Sounds/Music/FastBeat.wav")
@onready var ObstacleSpawner = get_node("ObstacleSpawner")
var Player
# Called when the node enters the scene tree for the first time.
func _ready():
	ObstacleSpawner.start_spawning()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !audio.is_playing():
		audio.stream = Sound
		audio.volume_db -= 10.0
		audio.play()
