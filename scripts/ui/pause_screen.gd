extends Control


#-------------------------------------------------------------------------------
func _on_ResumeButton_pressed():
	hide()
	get_tree().paused = false


#-------------------------------------------------------------------------------
func _on_RestartButton_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false


#-------------------------------------------------------------------------------
func _on_OptionsButton_pressed():
	pass # Replace with function body.


#-------------------------------------------------------------------------------
func _on_ExitButton_pressed():
	get_tree().change_scene("res://scenes/ui/main_menu_screen.tscn")
	get_tree().paused = false


#-------------------------------------------------------------------------------
func _input(event):
	if event.is_action_pressed("toggle_pause"):
		# If the pause menu is visible, unpause and hide the menu.
		if visible:
			hide()
			get_tree().paused = false
		
		# If the pause menu is not visible, only pause if not already paused.
		# This disables the user from opening the pause menu on the win or lose screen.
		elif not get_tree().paused:
			show()
			get_tree().paused = true


#-------------------------------------------------------------------------------
