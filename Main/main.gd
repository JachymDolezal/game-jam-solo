extends Node2D
@onready var audio = $AudioStreamPlayer
var Sound = preload("res://Assets/Sounds/Music/MenuSoundtrack.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !audio.is_playing():
		audio.stream = Sound
		#audio.play()
