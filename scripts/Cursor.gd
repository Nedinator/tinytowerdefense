extends Control

@onready var custom_cursor_texture: Texture = preload("res://assets/UI/Pointers/01.png")

func _ready():
	Input.set_custom_mouse_cursor(custom_cursor_texture, Input.CURSOR_ARROW)

func getPosition() -> Vector2:
	return get_global_mouse_position()
