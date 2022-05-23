extends KinematicBody2D

const SPEED = 100.0
const BulletScene = preload("res://scenes/bullet.tscn")


#-------------------------------------------------------------------------------
func _physics_process(_delta):
	var movement = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		movement.x -= SPEED
	if Input.is_action_pressed("move_right"):
		movement.x += SPEED
	if Input.is_action_pressed("move_up"):
		movement.y -= SPEED
	if Input.is_action_pressed("move_down"):
		movement.y += SPEED
	
	movement = move_and_slide(movement)
	
	
#-------------------------------------------------------------------------------
func _input(event):
	if event.is_action_pressed("shoot"):
		var bullet = BulletScene.instance()
		get_parent().add_child(bullet)
		var direction = (get_global_mouse_position() - global_position).normalized()
		bullet.set_direction(direction)
		bullet.position = $FirePoint.global_position
	
	if event is InputEventMouseMotion:
		var direction = get_global_mouse_position() - global_position
		rotation = direction.angle()


#-------------------------------------------------------------------------------
