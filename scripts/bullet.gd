extends Area2D

const SPEED = 1500.0
var velocity = Vector2(SPEED, 0.0)


#-------------------------------------------------------------------------------
func set_direction(direction):
	velocity = direction * SPEED
	rotation = atan2(velocity.y, velocity.x)


#-------------------------------------------------------------------------------
func _physics_process(delta):
	var movement = velocity * delta
	
	$RayCast2D.cast_to = movement.rotated(-rotation)
	$RayCast2D.force_raycast_update()
	if $RayCast2D.is_colliding():
		
		var normal = $RayCast2D.get_collision_normal()
		if Vector2.ZERO != normal:
			
			set_direction(velocity.bounce(normal).normalized())
			movement = velocity * delta
	
	else:	
		position += movement


#-------------------------------------------------------------------------------
