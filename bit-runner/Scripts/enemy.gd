extends Node2D
const SPEED = 30
var direction = -1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var animated_sprite = $AnimatedSprite2D


	# Add the gravity.
	
		
func _process(delta):
	

		
	if ray_cast_right.is_colliding():
		direction = 1
		animated_sprite.flip_h= false
	
	if ray_cast_left.is_colliding():
		direction = -1
		animated_sprite.flip_h = true	
	
	position.x += SPEED * delta * direction	 
	
