extends Area2D

class_name HurtboxComponent

signal hit_by_projectile(projectile: ProjectileBase)

@export var health_component : HealthComponent


func can_accept_bullet_collision():
	if health_component && health_component.owner_is_dead:
		return true;
	else:
		return false;


func handle_projectile_collision(projectile : ProjectileBase):
	hit_by_projectile.emit(projectile);
