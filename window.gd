extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_death_body_exited(body):
	print(body)
	if (body.name == "Player"):
		print("kill player")
		get_tree().change_scene_to_file("res://Menu/menu.tscn")
	else:
		pass
		body.queue_free()
