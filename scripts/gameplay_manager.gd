extends Node2D

signal level_complete()
signal level_failed()


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
		emit_signal("level_complete")
		print("You won!")


#-------------------------------------------------------------------------------
func _on_player_died():
	emit_signal("level_failed")
	print("You lost!")


#-------------------------------------------------------------------------------
