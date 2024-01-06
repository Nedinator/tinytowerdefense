extends Node2D

# Camera speed (adjust as needed)
var camera_speed = 500

func _process(delta):
	# Input handling for movement
	var movement = Vector2()

	if Input.is_action_pressed("right"):
		movement.x += 1
	if Input.is_action_pressed("left"):
		movement.x -= 1
	if Input.is_action_pressed("down"):
		movement.y += 1
	if Input.is_action_pressed("up"):
		movement.y -= 1

	# Normalize the movement vector to ensure consistent speed in all directions
	movement = movement.normalized()

	# Move the player
	translate(movement * delta * camera_speed)

