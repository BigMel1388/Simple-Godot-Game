extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0 
const maxjump = 2
var jump= 0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Reset the count after Double Jump
	if is_on_floor():
		jump = 0

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and jump < maxjump: #and is_on_floor():
		jump += 1 
		velocity.y = JUMP_VELOCITY
	

	# Flip the sprite on its direction
	var direction := Input.get_axis("Left", "Right")
	
	if direction < 0:
		animated_sprite_2d.flip_h = true
	elif direction > 0:
		animated_sprite_2d.flip_h = false
	#play animation
	if direction == 0:
		animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("Run")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
