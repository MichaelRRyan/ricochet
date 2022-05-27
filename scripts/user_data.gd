extends Node

var _furthest_completed_level = 0


#-------------------------------------------------------------------------------
func level_completed(level_number : int) -> void:
	if level_number > _furthest_completed_level:
		_furthest_completed_level = level_number


#-------------------------------------------------------------------------------
func get_furthest_completed_level() -> int:
	return _furthest_completed_level


#-------------------------------------------------------------------------------
