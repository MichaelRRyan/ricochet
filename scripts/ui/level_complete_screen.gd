extends Control


#-------------------------------------------------------------------------------
func _on_GameplayManager_level_complete():
	show()


#-------------------------------------------------------------------------------
func _on_RetryButton_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false


#-------------------------------------------------------------------------------