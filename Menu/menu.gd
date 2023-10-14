extends Node2D

@onready var audio = $AudioStreamPlayer2D
var Sound = preload("res://Assets/Sounds/Music/MenuSoundtrack.wav")

func _ready():
	pass

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Main/main.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _process(delta):
	if !audio.is_playing():
		audio.stream = Sound
		audio.play()
