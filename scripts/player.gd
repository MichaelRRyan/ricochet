extends KinematicBody2D

signal died()

const GUNSHOT_SOUND = "res://assets/audio/sounds/gunshot.wav"
const SPEED = 100.0
const BulletScene = preload("res://scenes/bullet.tscn")


#-------------------------------------------------------------------------------
func _input(event):
	if event.is_action_pressed("shoot"):
		var bullet = BulletScene.instance()
		get_parent().add_child(bullet)
		var direction = (get_global_mouse_position() - global_position).normalized()
		bullet.set_direction(direction)
		bullet.position = $FirePoint.global_position
		AudioManager.play(GUNSHOT_SOUND)
	
	if event is InputEventMouseMotion:
		var direction = get_global_mouse_position() - global_position
		rotation = direction.angle()


#-------------------------------------------------------------------------------
func _on_BulletDetector_area_entered(area):
	if area.is_in_group("projectile"):
		emit_signal("died")
		queue_free()


#-------------------------------------------------------------------------------
