extends Area2D

signal died()


#-------------------------------------------------------------------------------
func _on_area_entered(area):
	if area.is_in_group("projectile"):
		emit_signal("died")
		queue_free()


#-------------------------------------------------------------------------------
