extends Node2D
class_name ProjectileMovement_Component

@export var projectile_speed : float = 100

var owner_entity : ProjectileBase


func _ready():
	owner_entity = self.get_owner()


func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation);
	owner_entity.global_position += projectile_speed * direction * delta;
