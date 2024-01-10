extends Resource

class_name GameData

@export var level : int
@export var experience : int
@export var map_completion_scores : Dictionary = {}

func set_map_completion_score(map_name: String, completion_score: int):
	map_completion_scores[map_name] = completion_score

func get_map_completion_score(map_name: String) -> int:
	return map_completion_scores.get(map_name, 0)

func gain_experience(amount: int):
	experience += amount
	check_level_up()

func check_level_up():
	var required_experience_for_next_level = calculate_required_experience(level + 1)

	while experience >= required_experience_for_next_level:
		level += 1
		experience -= required_experience_for_next_level
		required_experience_for_next_level = calculate_required_experience(level + 1)

func calculate_required_experience(target_level: int) -> int:
	return 100 * int(pow(1.2, target_level) + 0.5)
