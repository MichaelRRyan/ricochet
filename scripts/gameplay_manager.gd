extends Node2D

signal level_complete()
signal level_failed()
signal game_complete()

const LAST_LEVEL_NUMBER = 5

export var level_number : int = -1

var enemy_count = -1


#-------------------------------------------------------------------------------
func _ready():
	var enemies = get_tree().get_nodes_in_group("enemy")
	enemy_count = enemies.size()
	for enemy in enemies:
		enemy.connect("died", self, "_on_enemy_died")
	
	var players = get_tree().get_nodes_in_group("player")
	if not players.empty():
		players.front().connect("died", self, "_on_player_died")


#-------------------------------------------------------------------------------
func _on_enemy_died():
	enemy_count -= 1
	
	if enemy_count == 0:
		UserData.level_completed(level_number)
		get_tree().paused = true
		
		if LAST_LEVEL_NUMBER == level_number:
			emit_signal("game_complete")
		else:
			emit_signal("level_complete")


#-------------------------------------------------------------------------------
func _on_player_died():
	emit_signal("level_failed")
	get_tree().paused = true


#-------------------------------------------------------------------------------
func _on_LevelCompleteScreen_next_level_button_pressed():
	var level_path = "res://scenes/levels/level" + str(level_number + 1) + ".tscn"
	if ResourceLoader.exists(level_path):
		if get_tree().change_scene(level_path) != OK:
			print("Error switching to the next leve.")
			
		get_tree().paused = false
		
	else:
		print("No 'level " + str(level_number + 1) + "' found.")


#-------------------------------------------------------------------------------
