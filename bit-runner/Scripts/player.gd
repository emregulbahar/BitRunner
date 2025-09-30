extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -250.0
@onready var animated_sprite_2d= $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	
	if direction >0:
		animated_sprite_2d.flip_h=false
	elif direction<0:
		animated_sprite_2d.flip_h= true
		
	if is_on_floor():
		if direction== 0:
			animated_sprite_2d.play("Idle")
		else:
			animated_sprite_2d.play("Walk")		
	else:
		animated_sprite_2d.play("Jump")
				
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
