extends Control

signal next_level_button_pressed()


#-------------------------------------------------------------------------------
func _on_GameplayManager_level_complete():
	show()
	$LevelCompleteSound.play()


#-------------------------------------------------------------------------------
func _on_NextLevelButton_pressed():
	emit_signal("next_level_button_pressed")
	
	
#-------------------------------------------------------------------------------
func _on_RetryButton_pressed():
	var _r = get_tree().reload_current_scene()
	get_tree().paused = false


#-------------------------------------------------------------------------------
func _on_ExitButton_pressed():
	var _r = get_tree().change_scene("res://scenes/ui/main_menu_screen.tscn")
	get_tree().paused = false


#-------------------------------------------------------------------------------
