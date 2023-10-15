extends CharacterBody2D


const SPEED = 100

var gravity = 0


func _physics_process(delta):

	velocity.x = 1 * SPEED

	move_and_slide()


func _on_on_impact_body_entered(body):
	# free self
	if body.name != "Bullet":
		self.queue_free()
	print("bullet",body)
	
