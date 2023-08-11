extends "res://Entity/base_character.gd"
class_name SlimeEnemy

@export var detectionarea_component : DetectionAreaComponent
@export var movement_component : MovementComponent



func _physics_process(delta):
	if movement_component && detectionarea_component.check_if_player_detected():
		movement_component.move_owner(detectionarea_component.return_player_location(), delta)
	else:
		movement_component.stop_moving()
	update_animations()
	handle_sprite_rotation()
	move_and_slide()


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
