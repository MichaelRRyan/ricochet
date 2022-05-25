extends Control


#-------------------------------------------------------------------------------
func _ready():
	_set_options_match_preferences()


#-------------------------------------------------------------------------------
func _on_BackButton_pressed():
	var _r = get_tree().change_scene("res://scenes/ui/main_menu_screen.tscn")


#-------------------------------------------------------------------------------
func _on_ResetToDefaultButton_pressed():
	UserPreferences.reset_all()
	_set_options_match_preferences()


#-------------------------------------------------------------------------------
func _set_options_match_preferences():
	$Settings/MasterVolume/HSlider.value = UserPreferences.get_master_volume()
	$Settings/SFXVolume/HSlider.value = UserPreferences.get_raw_sfx_volume()
	$Settings/MusicVolume/HSlider.value = UserPreferences.get_raw_music_volume()
	
	$Settings/MasterVolume/MuteButton.pressed = UserPreferences.get_master_volume_muted()
	$Settings/SFXVolume/MuteButton.pressed = UserPreferences.get_raw_sfx_volume_muted()
	$Settings/MusicVolume/MuteButton.pressed = UserPreferences.get_raw_music_volume_muted()
	
	$Settings/Fullscreen/CheckBox.pressed = UserPreferences.get_fullscreen()


#-------------------------------------------------------------------------------
func _on_MasterVolume_value_changed(value):
	UserPreferences.set_master_volume(value)


#-------------------------------------------------------------------------------
func _on_MasterVolumeMute_toggled(button_pressed):
	UserPreferences.set_master_volume_muted(button_pressed)


#-------------------------------------------------------------------------------
func _on_SFXVolume_value_changed(value):
	UserPreferences.set_sfx_volume(value)


#-------------------------------------------------------------------------------
func _on_SFXVolumeMute_toggled(button_pressed):
	UserPreferences.set_sfx_volume_muted(button_pressed)


#-------------------------------------------------------------------------------
func _on_MusicVolume_value_changed(value):
	UserPreferences.set_music_volume(value)


#-------------------------------------------------------------------------------
func _on_MusicVolumeMute_toggled(button_pressed):
	UserPreferences.set_music_volume_muted(button_pressed)


#-------------------------------------------------------------------------------
func _on_Fullscreen_toggled(button_pressed):
	UserPreferences.set_fullscreen(button_pressed)


#-------------------------------------------------------------------------------
