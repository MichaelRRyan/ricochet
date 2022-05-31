extends Area2D

signal died()

const DEATH_SOUND = "res://assets/audio/sounds/death"


#-------------------------------------------------------------------------------
func _on_area_entered(area):
	if area.is_in_group("projectile"):
		emit_signal("died")
		queue_free()
		AudioManager.play(DEATH_SOUND + str(randi() % 3) + ".wav")


#-------------------------------------------------------------------------------
