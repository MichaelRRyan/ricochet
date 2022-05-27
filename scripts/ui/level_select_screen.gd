extends Control

var _level_buttons = []


#-------------------------------------------------------------------------------
func _ready():
	_level_buttons = get_tree().get_nodes_in_group("level_button")
	
	for i in _level_buttons.size():
		_level_buttons[i].set_level_number(i + 1)


#-------------------------------------------------------------------------------
func _on_BackButton_pressed():
	var _r = get_tree().change_scene("res://scenes/ui/main_menu_screen.tscn")


#-------------------------------------------------------------------------------
