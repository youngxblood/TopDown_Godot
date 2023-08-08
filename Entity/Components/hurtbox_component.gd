extends Area2D

class_name HurtboxComponent

signal hit_by_bullet(bullet: Bullet)

@export var health_component : HealthComponent


func can_accept_bullet_collision():
	if health_component && health_component.owner_is_dead:
		return true;
	else:
		return false;


func handle_bullet_collision(bullet : Bullet):
	hit_by_bullet.emit(bullet);


func _on_area_entered(other_area):
	if other_area is HitboxComponent:
		print_debug("Hit a hitbox");
