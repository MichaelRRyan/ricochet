extends Control


#-------------------------------------------------------------------------------
func _on_PlayButton_pressed():
	pass # Replace with function body.


#-------------------------------------------------------------------------------
func _on_OptionsButton_pressed():
	var _r = get_tree().change_scene("res://scenes/ui/options_screen.tscn")


#-------------------------------------------------------------------------------
func _on_ExitButton_pressed():
	get_tree().quit()


#-------------------------------------------------------------------------------
