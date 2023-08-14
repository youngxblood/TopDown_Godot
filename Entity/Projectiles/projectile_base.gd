extends Node2D
class_name ProjectileBase	

@onready var sprite : Sprite2D = $Sprite2D

@export var hitbox_component : HitboxComponent

var projectile_owner : BaseCharacter # Used to ensure owner does not get hit by projectile
var projectile_speed = 300

func _physics_process(delta):
	var direction : Vector2 = Vector2.RIGHT.rotated(rotation);
	global_position += projectile_speed * direction * delta;


func destroy_projectile():
	self.queue_free()
