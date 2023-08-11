extends Node2D
class_name MovementComponent

@export var speed : float = 300

var owner_entity #: BaseCharacter

func _ready():
	owner_entity = self.get_owner()

func move_owner(destination : Vector2):
	destination = destination - owner_entity.position
	owner_entity.velocity = destination * speed
