extends Node2D

const speed = 50
var direction = 1

@onready var left: RayCast2D = $left
@onready var right: RayCast2D = $right
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if left.is_colliding():
		animated_sprite_2d.flip_h = false
		direction = 1
	if right.is_colliding():
		animated_sprite_2d.flip_h = true
		direction = -1
	position.x += direction * speed * delta
