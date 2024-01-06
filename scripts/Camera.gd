extends Node2D

@export var camera_speed = 500

func _process(delta):
	var movement = Vector2()

	if Input.is_action_pressed("right"):
		movement.x += 1
	if Input.is_action_pressed("left"):
		movement.x -= 1
	if Input.is_action_pressed("down"):
		movement.y += 1
	if Input.is_action_pressed("up"):
		movement.y -= 1
	
	movement = movement.normalized()
	translate(movement * delta * camera_speed)

