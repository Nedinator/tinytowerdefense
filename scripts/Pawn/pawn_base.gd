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
@onready var cursor = %Cursor
@onready var select_box = $selectBox/CollisionShape2D


func setPawnState(state: PawnStates):
	pawn_state = state;

func setAnimation(state: PawnStates):
	tree.play(str(state).to_lower())

func _on_select_box_mouse_entered():
	pawn_menu.visible = true

func _on_select_box_mouse_exited():
	pawn_menu.visible = false
