extends RigidBody2D
@onready var Despawn = $Despawn

# Called when the node enters the scene tree for the first time.
func _ready():
	Despawn.one_shot = true
	Despawn.wait_time = 100
	Despawn.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Despawn.is_stopped():
		queue_free()




func _on_player_death_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Menu/menu.tscn")

