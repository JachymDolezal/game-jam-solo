extends Camera2D



var scroll_speed = 40  # Adjust the scrolling speed as needed

func _process(delta):
	# Get the current camera position
	var current_position = position

	# Move the camera to the right
	#current_position.x = self.global_position.x
	current_position.y -= scroll_speed * delta

	# Set the new camera position
	position = current_position
