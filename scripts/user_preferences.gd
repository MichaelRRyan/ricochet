extends Node

var _master_volume : float = 1.0 setget set_master_volume, get_master_volume
var _sfx_volume : float = 1.0  setget set_sfx_volume, get_sfx_volume
var _music_volume : float = 1.0  setget set_music_volume, get_music_volume

var _master_volume_muted : bool = false setget set_master_volume_muted, get_master_volume_muted
var _sfx_volume_muted : bool = false setget set_sfx_volume_muted, get_sfx_volume_muted
var _music_volume_muted : bool = false setget set_music_volume_muted, get_music_volume_muted

var volume_curve = preload("res://resources/curves/volume_curve.tres")
var master_bus = AudioServer.get_bus_index("Master")


#-------------------------------------------------------------------------------
func reset_all():
	_master_volume = 1.0
	_sfx_volume = 1.0
	_music_volume = 1.0
	_master_volume_muted = false
	_sfx_volume_muted = false
	_music_volume_muted = false
	
	var new_volume = volume_curve.interpolate(get_sfx_volume())
	AudioServer.set_bus_volume_db(master_bus, new_volume)
	AudioServer.set_bus_mute(master_bus, get_sfx_volume_muted())


#-------------------------------------------------------------------------------
func set_master_volume(value : float) -> void:
	_master_volume = value
	var new_volume = volume_curve.interpolate(get_sfx_volume())
	AudioServer.set_bus_volume_db(master_bus, new_volume)


#-------------------------------------------------------------------------------
func set_sfx_volume(value : float) -> void:
	_sfx_volume = value
	var new_volume = volume_curve.interpolate(get_sfx_volume())
	AudioServer.set_bus_volume_db(master_bus, new_volume)


#-------------------------------------------------------------------------------
func set_music_volume(value : float) -> void:
	_music_volume = value


#-------------------------------------------------------------------------------
func set_master_volume_muted(value : bool) -> void:
	_master_volume_muted = value
	AudioServer.set_bus_mute(master_bus, get_sfx_volume_muted())


#-------------------------------------------------------------------------------
func set_sfx_volume_muted(value : bool) -> void:
	_sfx_volume_muted = value
	AudioServer.set_bus_mute(master_bus, get_sfx_volume_muted())


#-------------------------------------------------------------------------------
func set_music_volume_muted(value : bool) -> void:
	_music_volume_muted = value


#-------------------------------------------------------------------------------
func set_fullscreen(value : bool) -> void:
	OS.window_fullscreen = value


#-------------------------------------------------------------------------------
func get_master_volume() -> float:
	return _master_volume


#-------------------------------------------------------------------------------
func get_sfx_volume() -> float:
	return _sfx_volume * _master_volume


#-------------------------------------------------------------------------------
func get_music_volume() -> float:
	return _music_volume * _master_volume


#-------------------------------------------------------------------------------
func get_fullscreen() -> bool:
	return OS.window_fullscreen


#-------------------------------------------------------------------------------
func get_master_volume_muted() -> bool:
	return _master_volume_muted


#-------------------------------------------------------------------------------
func get_sfx_volume_muted() -> bool:
	return _sfx_volume_muted or _master_volume_muted


#-------------------------------------------------------------------------------
func get_music_volume_muted() -> bool:
	return _music_volume_muted or _master_volume_muted


#-------------------------------------------------------------------------------
func get_raw_sfx_volume() -> float:
	return _sfx_volume


#-------------------------------------------------------------------------------
func get_raw_music_volume() -> float:
	return _music_volume


#-------------------------------------------------------------------------------
func get_raw_sfx_volume_muted() -> bool:
	return _sfx_volume_muted


#-------------------------------------------------------------------------------
func get_raw_music_volume_muted() -> bool:
	return _music_volume_muted


#-------------------------------------------------------------------------------
