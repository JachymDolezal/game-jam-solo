extends RigidBody2D
@onready var Despawn = $Despawn
signal player_contact
# Called when the node enters the scene tree for the first time.
func _ready():
	Despawn.one_shot = true
	Despawn.wait_time = 100
	Despawn.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Despawn.is_stopped():
		queue_free()


func _on_player_jump_reset_body_entered(body):
	if body.name == "Player":
		player_contact.emit()
		Game.can_wall_jump = true
		print("Jumped to")


func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		player_contact.emit()
		Game.can_wall_jump = false
		print("Existing obj")
