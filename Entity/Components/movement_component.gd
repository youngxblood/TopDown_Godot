extends Node2D
class_name MovementComponent

@export var speed : float = 100

var owner_entity : BaseCharacter

func _ready():
	owner_entity = self.get_owner()


## Used to move owner. Takes a destination (Vector2) and delta time. 
func move_owner(destination : Vector2, delta : float):
	destination = destination - owner_entity.position
	owner_entity.velocity = destination * speed * delta 

	handle_sprite_rotation(destination)


## Used to stop movement of owner
func stop_moving():
	owner_entity.velocity = Vector2.ZERO


## Handle sprite facing
func handle_sprite_rotation(direction : Vector2):
	if direction.x <= -1:
		owner_entity.animated_sprite.flip_h = true;
	elif direction.x >= 1:
		owner_entity.animated_sprite.flip_h = false;
