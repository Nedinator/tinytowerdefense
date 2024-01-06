extends Node2D

func _ready():
	var custom_cursor_texture: CompressedTexture2D = preload("res://assets/UI/Pointers/01.png")
	Input.set_custom_mouse_cursor(custom_cursor_texture, Input.CURSOR_ARROW, Vector2(16, 16))

func getPosition():
	print(get_global_mouse_position())
	return get_global_mouse_position()
