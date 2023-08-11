extends "res://Entity/base_character.gd"

@export var speed : float = 300;
var current_velocity : Vector2 = Vector2.ZERO


func _physics_process(delta):
	read_input()
	update_animations()
	handle_sprite_rotation()
	move_and_slide()

func read_input():
	var move_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = move_direction * speed


## Handle sprite animations
func update_animations():
	if velocity == Vector2.ZERO:
		anim_player.play("Idle")
	if velocity != Vector2.ZERO:
		anim_player.play("Run")


## Handle sprite facing
func handle_sprite_rotation():
	var direction = Input.get_axis("move_left", "move_right");
	if direction == -1:
		animated_sprite.flip_h = true;
	elif direction == 1:
		animated_sprite.flip_h = false;
