extends Node2D
class_name ProjectileBase	

@export var hitbox_component : HitboxComponent
var projectile_owner : BaseCharacter # Used to ensure owner does not get hit by projectile