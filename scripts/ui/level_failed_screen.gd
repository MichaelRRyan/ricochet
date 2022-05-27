extends Control

const LEVEL_FAILED_SOUND = "res://assets/audio/sounds/lose.wav"


#-------------------------------------------------------------------------------
func _on_GameplayManager_level_failed():
	show()
	AudioManager.play(LEVEL_FAILED_SOUND)


#-------------------------------------------------------------------------------
func _on_RetryButton_pressed():
	var _r = get_tree().reload_current_scene()
	get_tree().paused = false


#-------------------------------------------------------------------------------
func _on_ExitButton_pressed():
	var _r = get_tree().change_scene("res://scenes/ui/main_menu_screen.tscn")
	get_tree().paused = false


#-------------------------------------------------------------------------------
