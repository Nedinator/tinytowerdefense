class_name pawn_base
extends entity_base

enum PawnStates {
	IDLE,
	CHOP,
	MINE,
	RUN,
	RETREAT
}

@export var hurtbox : Area2D

@onready var tree: AnimationTree = $AnimationTree
@onready var pawn_menu = $PawnMenu
@onready var pawn_state = PawnStates.IDLE
@export var select_box : Area2D
@onready var cursor = %Cursor

func _physics_process(delta):
	if(Input.is_action_just_pressed("select")):
		if is_cursor_inside_area(Vector2(cursor.getPosition()) , select_box):
			toggleSelected()

func setPawnState(state: PawnStates):
	pawn_state = state;

func setAnimation(state: PawnStates):
	tree.play(str(state).to_lower())

func toggleSelected():
	pawn_menu.visible = !pawn_menu.visible

func is_cursor_inside_area(cursor_position: Vector2, area: Area2D) -> bool:
	print(cursor_position)
	return true #working on figuring this out. i may need to make an artificial area2d for the cursor position
