class_name PawnBase
extends Node2D

enum PawnStates {
	IDLE,
	CHOP,
	MINE,
	RUN,
	RETREAT
}

@export var hurtbox : Area2D

@onready var tree: AnimationTree = $AnimationTree
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var pawn_menu = $PawnMenu
@onready var pawn_state = PawnStates.IDLE
@onready var cursor = %Cursor
@onready var select_box = $selectBox/CollisionShape2D
@onready var tile_map = %"TileMap"

var astar_grid: AStarGrid2D
var current_id_path: Array[Vector2i]

func _ready():
	astar_grid = AStarGrid2D.new()
	astar_grid.region = tile_map.get_used_rect()
	astar_grid.cell_size = Vector2(64, 64)
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar_grid.update()

func _input(event):
	if event.is_action_pressed("select") == false:
		return
	
	var id_path = astar_grid.get_id_path(
		tile_map.local_to_map(global_position), 
		tile_map.local_to_map(get_global_mouse_position())
		).slice(1)
	
	if id_path.is_empty() == false:
		current_id_path = id_path


func _physics_process(delta):
	if current_id_path.is_empty():
		return
	
	var target_position = tile_map.map_to_local(current_id_path.front())
	global_position = global_position.move_toward(target_position, 2)
	setPawnState(PawnStates.RUN)
	
	if global_position == target_position:
		current_id_path.pop_front()

func setPawnState(state: PawnStates):
	pawn_state = state;
	setAnimation(state)

func setAnimation(state: PawnStates):
	anim_player.play(str(state).to_lower())

func _on_select_box_mouse_entered():
	pawn_menu.visible = true

func _on_select_box_mouse_exited():
	pawn_menu.visible = false

