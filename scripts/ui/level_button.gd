extends Button

const LEVELS_ROOT = "res://scenes/levels/"

var _completed_theme = preload("res://resources/themes/level_button_completed_theme.tres")
var _scene_name = ""


#-------------------------------------------------------------------------------
func set_level_number(level_number : int) -> void:
	$LevelName.text = "Level " + str(level_number)
	_scene_name = LEVELS_ROOT + "level" + str(level_number) + ".tscn"
	
	if ResourceLoader.exists(_scene_name):
		var furthest_level = UserData.get_furthest_completed_level()
		
		if level_number <= furthest_level:
			$Status.text = "Completed"
			theme = _completed_theme
			
		elif level_number == furthest_level + 1:
			$Status.text = "Incomplete"
		
		else:
			$Status.text = "Locked"
			disabled = true
	else:
		$Status.text = "Coming soon"
		disabled = true


#-------------------------------------------------------------------------------
func _on_pressed():
	var _r = get_tree().change_scene(_scene_name)


#-------------------------------------------------------------------------------
